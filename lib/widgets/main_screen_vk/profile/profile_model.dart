import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client_exaption.dart';
import 'package:vk_example/domain/entity/profile_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';
import 'package:vk_example/domain/services/data_service.dart';

class ProfileData {
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

class ProfileViewModel extends ChangeNotifier {
  final profileData = ProfileData();
  final _dataService = DataService();
  var errorTextProfile = false;
  MyPhoto? _userPhoto;

  MyPhoto? get friendPhoto => _userPhoto;

  ProfileViewModel() {
    _asyncInit();
  }

  void _asyncInit() async {
    await loadProfileInfo();
  }

  Future<void> loadProfileInfo() async {
    try {
      final userInfo = await _dataService.loadProfileInfo();
      _update(userInfo);
      await loadProfilePhoto();
      errorTextProfile = false;
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextProfile = true;
          notifyListeners();
          break;
      }
    }
  }

  void _update(MyProfile? userInfo) {
    profileData.isLoading = userInfo == null;
    if (userInfo == null) {
      notifyListeners();
      return;
    }
    profileData.firstName = userInfo.response.first.firstName;
    profileData.lastName = userInfo.response.first.lastName;
    profileData.photo = userInfo.response.first.photo_100 ?? '';
    profileData.sex = sexSelect(userInfo);
    profileData.bdate = userInfo.response.first.bdate;
    profileData.country = userInfo.response.first.country?.title;
    profileData.city = userInfo.response.first.city?.title;
    profileData.interests = userInfo.response.first.interests;
    profileData.music = userInfo.response.first.music;
    profileData.movies = userInfo.response.first.movies;
    profileData.games = userInfo.response.first.games;
    notifyListeners();
  }

  String sexSelect(MyProfile? userInfo) {
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
    return _userPhoto?.response.items?[index].sizes?[2].url ?? '';
  }

  String maxPhotoUrl(int index) {
    return _userPhoto?.response.items?[index].sizes?[6].url ?? '';
  }

  Future<void> loadProfilePhoto() async {
    final userPhoto = await _dataService.loadProfilePhoto();
    _userPhoto = userPhoto;
    notifyListeners();
  }
}
