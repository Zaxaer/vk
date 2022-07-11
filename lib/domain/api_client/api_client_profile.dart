import 'package:vk_example/domain/api_client/network_api_client.dart';
import 'package:vk_example/domain/entity/profile_info.dart';
import 'package:vk_example/domain/entity/profile_photo.dart';

class ApiClientProfile {
  final _networkApiClient = NetworkApiClient();

  Future<MyProfile> myProfile(String accesToken, String userId) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MyProfile.fromJson(jsonMap);
      return response;
    }

    final result = _networkApiClient.get(
        'users.get?',
        'user_ids=$userId&fields=photo_100,bdate,city,country,education,sex,interest,music,online,movies,city,books,games,verified',
        '&access_token=$accesToken',
        parser);
    return result;
  }

  Future<MyPhoto> myPhotoProfile(String accesToken, String userId) async {
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
}
