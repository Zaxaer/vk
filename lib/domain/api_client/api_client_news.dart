import 'package:vk_example/domain/api_client/network_api_client.dart';
import 'package:vk_example/domain/entity/new_feed.dart';

class ApiClientNews {
  final _networkApiClient = NetworkApiClient();
  Future<NewsFeed> myNewsFeed(String path, String accesToken) async {
    parser(dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = NewsFeed.fromJson(jsonMap);
      return response;
    }

    final result = _networkApiClient.get(
      'newsfeed.get?',
      'start_from=$path',
      '&access_token=$accesToken',
      parser,
    );
    return result;
  }
}
