import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/domain/entity/list_friends.dart';
import 'package:vk_example/navigation/main_navigation.dart';

class MyListFriendViewModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  ListFriend? _myFriendList;
  var errorTextListFriend = false;

  ListFriend? get myFriendList => _myFriendList;

  MyListFriendViewModel() {
    loadListFriend();
  }

  Future<void> loadListFriend() async {
    try {
      _myFriendList = await _apiClient.myListFriends();
      errorTextListFriend = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextListFriend = true;
          notifyListeners();
          break;
      }
    }
  }

  void onFriendInfo(BuildContext context, int userId) {
    Navigator.of(context).pushNamed(
      MainNavigationRouteNames.friendInfo,
      arguments: userId,
    );
  }
}
