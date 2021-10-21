import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/domain/entity/friend_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';

class ProfileFriendsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  int userId;
  FriendInfo? _userInfo;
  MyPhoto? _userPhoto;
  var errorTextFriendInfo = false;

  ProfileFriendsModel({required this.userId});

  FriendInfo? get friendInfo => _userInfo;
  MyPhoto? get friendPhoto => _userPhoto;

  Future<void> loadInfo(BuildContext context) async {
    try {
      _userInfo = await _apiClient.friendInfo(userId);
      await loadPhoto();
      notifyListeners();
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextFriendInfo = true;
          notifyListeners();
          break;
      }
    }
  }

  Future<void> loadPhoto() async {
    _userPhoto = await _apiClient.myPhotoFriend(userId);
    notifyListeners();
  }
}
