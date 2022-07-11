import 'package:vk_example/domain/api_client/network_api_client.dart';
import 'package:vk_example/domain/entity/friend_info.dart';
import 'package:vk_example/domain/entity/list_friends.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';

class ApiClientFriend {
  final _networkApiClient = NetworkApiClient();

  Future<FriendInfo> friendInfo(int userId, String accesToken) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = FriendInfo.fromJson(jsonMap);
      return response;
    }

    final result = _networkApiClient.get(
      'users.get?',
      'user_ids=$userId&fields=photo_100,bdate,city,country,education,sex,interest,music,online,movies,city,books,games,verified',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<MyPhoto> myPhotoFriend(int userId, String accesToken) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MyPhoto.fromJson(jsonMap);
      return response;
    }

    final result = _networkApiClient.get(
      'photos.getAll?',
      'owner_id=$userId&count=200',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<ListFriend> myListFriends(String accesToken, String userId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = ListFriend.fromJson(jsonMap);
      return response;
    }

    final result = _networkApiClient.get(
      'friends.get?',
      'user_id=$userId&order=hints&list_id&fields=photo_100,online',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }
}
