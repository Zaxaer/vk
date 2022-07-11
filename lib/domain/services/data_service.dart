import 'package:vk_example/domain/api_client/api_client_friend.dart';
import 'package:vk_example/domain/api_client/api_client_news.dart';
import 'package:vk_example/domain/api_client/api_client_profile.dart';
import 'package:vk_example/domain/data_provider.dart/data_provider.dart';
import 'package:vk_example/domain/entity/friend_info.dart';
import 'package:vk_example/domain/entity/list_friends.dart';
import 'package:vk_example/domain/entity/new_feed.dart';
import 'package:vk_example/domain/entity/profile_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';
import 'package:vk_example/domain/services/auth_services.dart';

class DataService {
  final _sessionDataProvider = SessionDataProvider();
  final _apiClientFriend = ApiClientFriend();
  final _authServices = AuthServices();
  final _apiClientNews = ApiClientNews();
  final _apiClientProfile = ApiClientProfile();

  Future<FriendInfo> loadFriendInfo(int userId) async {
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final friendInfo = await _apiClientFriend.friendInfo(userId, accesToken);
    return friendInfo;
  }

  Future<MyPhoto> myPhotoFriend(int userId) async {
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final photoFriend =
        await _apiClientFriend.myPhotoFriend(userId, accesToken);
    return photoFriend;
  }

  Future<ListFriend> loadProfileListFriend() async {
    final userId = await _sessionDataProvider.getUserId() ?? '';
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final listFriend = await _apiClientFriend.myListFriends(accesToken, userId);
    return listFriend;
  }

  Future<NewsFeed> loadNewsFeed(String path) async {
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final newsFeed = await _apiClientNews.myNewsFeed(path, accesToken);
    return newsFeed;
  }

  Future<MyProfile> loadProfileInfo() async {
    final userId = await _sessionDataProvider.getUserId() ?? '';
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final profileInfo = await _apiClientProfile.myProfile(accesToken, userId);
    return profileInfo;
  }

  Future<MyPhoto> loadProfilePhoto() async {
    final userId = await _sessionDataProvider.getUserId() ?? '';
    final accesToken = await _sessionDataProvider.getToken() ?? '';
    final myPhoto = await _apiClientProfile.myPhotoProfile(accesToken, userId);
    return myPhoto;
  }

  void exitAccount() {
    _authServices.exitAccount();
  }
}
