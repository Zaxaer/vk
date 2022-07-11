import 'package:flutter/material.dart';

import 'package:vk_example/domain/api_client/api_client_exaption.dart';
import 'package:vk_example/domain/entity/friend_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';
import 'package:vk_example/domain/services/data_service.dart';

class ProfileFriendsData {
  bool isLoading = true;
  String firstName = '';
  String lastName = '';
  String photo = '';
  String sex = '';
  String? bdate = '';
  String? country = '';
  String? city = '';
  String? interests = '';
  String? music = '';
  String? movies = '';
  String? games = '';
}

class ProfileFriendsViewModel extends ChangeNotifier {
  final profileFriendsData = ProfileFriendsData();
  final _dataService = DataService();
  int userId;
  MyPhoto? _userPhoto;
  MyPhoto? get friendPhoto => _userPhoto;
  var errorTextFriendInfo = false;

  ProfileFriendsViewModel({required this.userId}) {
    _asyncInit();
  }

  void _asyncInit() async {
    await loadFriendInfo();
  }

  Future<void> loadFriendInfo() async {
    try {
      final _userInfo = await _dataService.loadFriendInfo(userId);
      _updateProfileFriend(_userInfo);
      await loadFriendPhoto();
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextFriendInfo = true;
          notifyListeners();
          break;
      }
    }
  }

  void _updateProfileFriend(FriendInfo? userInfo) {
    profileFriendsData.isLoading = userInfo == null;
    if (userInfo == null) {
      notifyListeners();
      return;
    }
    profileFriendsData.firstName = userInfo.response.first.firstName;
    profileFriendsData.lastName = userInfo.response.first.lastName;
    profileFriendsData.photo = userInfo.response.first.photo_100 ?? '';
    profileFriendsData.sex = sexSelect(userInfo);
    profileFriendsData.bdate = userInfo.response.first.bdate;
    profileFriendsData.country = userInfo.response.first.country?.title;
    profileFriendsData.city = userInfo.response.first.city?.title;
    profileFriendsData.interests = userInfo.response.first.interests;
    profileFriendsData.music = userInfo.response.first.music;
    profileFriendsData.movies = userInfo.response.first.movies;
    profileFriendsData.games = userInfo.response.first.games;
    notifyListeners();
  }

  String sexSelect(FriendInfo? userInfo) {
    var sex = '';
    if (userInfo?.response.first.sex == null) {
      sex = 'Не выбран';
    } else {
      switch (userInfo?.response.first.sex) {
        case (1):
          sex = 'Жениский';
          break;
        case (2):
          sex = 'Мужской';
      }
    }
    return sex;
  }

  String minPhotoUrl(int index) {
    final url = _userPhoto?.response.items?[index].sizes?[2].url;
    return url ?? '';
  }

  String maxPhotoUrl(int index) {
    final url = _userPhoto?.response.items?[index].sizes?.last.url;
    return url ?? '';
  }

  Future<void> loadFriendPhoto() async {
    final userPhoto = await _dataService.myPhotoFriend(userId);
    _userPhoto = userPhoto;
    notifyListeners();
  }
}
