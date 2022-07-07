import 'dart:convert';
import 'dart:io';

import 'package:vk_example/domain/data_provider.dart/data_provider.dart';
import 'package:vk_example/domain/entity/friend_info.dart';
import 'package:vk_example/domain/entity/list_friends.dart';
import 'package:vk_example/domain/entity/new_feed.dart';
import 'package:vk_example/domain/entity/profile_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';

enum ApiClientExceptionTipe { network }

class ApiClientException implements Exception {
  final ApiClientExceptionTipe type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  final _sessionDataProvider = SessionDataProvider();
  static const authVkJoin =
      'https://oauth.vk.com/authorize?client_id=7949325&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,photos,audio,video,status,wall&response_type=token&v=5.131&state=123456';
  static const _host = 'https://api.vk.com/method/';
  static const _version = '&v=5.131';

  Future<T> _get<T>(String metod, String parameters, String accesToken,
      T Function(dynamic json) parser) async {
    try {
      final url = _makeUri(metod, parameters, accesToken);
      final request = await _client.getUrl(url);
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionTipe.network);
    } catch (_) {
      throw ApiClientException(ApiClientExceptionTipe.network);
    }
  }

  Uri _makeUri(
    String metod,
    String parameters,
    String accesToken,
  ) {
    final uri = Uri.parse('$_host$metod$parameters$accesToken$_version');
    return uri;
  }

  Future<MyProfile> myProfile() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MyProfile.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final userId = await _sessionDataProvider.getUserId();
    final result = _get(
        'users.get?',
        'user_ids=$userId&fields=photo_100,bdate,city,country,education,sex,interest,music,online,movies,city,books,games,verified',
        '&access_token=$accesToken',
        parser);
    return result;
  }

  Future<MyPhoto> myPhotoProfile() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MyPhoto.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final userId = await _sessionDataProvider.getUserId();
    final result = _get(
      'photos.getAll?',
      'owner_id=$userId&count=200',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<ListFriend> myListFriends() async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = ListFriend.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final userId = await _sessionDataProvider.getUserId();
    final result = _get(
      'friends.get?',
      'user_id=$userId&order=hints&list_id&fields=photo_100,online',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<FriendInfo> friendInfo(int userId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = FriendInfo.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final result = _get(
      'users.get?',
      'user_ids=$userId&fields=photo_100,bdate,city,country,education,sex,interest,music,online,movies,city,books,games,verified',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<MyPhoto> myPhotoFriend(int userId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MyPhoto.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final result = _get(
      'photos.getAll?',
      'owner_id=$userId&count=200',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }

  Future<NewsFeed> myNewsFeed(String path) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = NewsFeed.fromJson(jsonMap);
      return response;
    }

    final accesToken = await _sessionDataProvider.getToken();
    final result = _get(
      'newsfeed.get?',
      'start_from=$path',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
