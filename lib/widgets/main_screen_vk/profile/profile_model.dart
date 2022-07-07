import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/domain/entity/profile_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';

class ProfileViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  var errorTextProfile = false;
  MyProfile? _userInfo;
  MyPhoto? _userPhoto;

  MyProfile? get userInfo => _userInfo;
  MyPhoto? get userPhoto => _userPhoto;

  ProfileViewModel() {
    loadInfo();
  }

  Future<void> loadInfo() async {
    try {
      _userInfo = await _apiClient.myProfile();
      await loadPhoto();
      errorTextProfile = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextProfile = true;
          notifyListeners();
          break;
      }
    }
  }

  Future<void> loadPhoto() async {
    _userPhoto = await _apiClient.myPhotoProfile();
    notifyListeners();
  }
}
