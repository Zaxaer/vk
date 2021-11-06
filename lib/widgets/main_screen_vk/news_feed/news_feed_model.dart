import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vk_example/domain/api_client/api_client.dart';
import 'package:vk_example/domain/entity/new_feed.dart';

class NewsFeedWidgetModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  NewsFeed? _newsFeed;
  final _item = <Item>[];
  final _profile = <Profile>[];
  final _groups = <Group>[];
  var errorTextNews = false;

  List<Item> get item => List.unmodifiable(_item);
  List<Profile> get profile => List.unmodifiable(_profile);
  List<Group> get groups => List.unmodifiable(_groups);
  NewsFeed? get newsFeed => _newsFeed;

  Future<void> loadNewsFeed(String path) async {
    try {
      _newsFeed = await _apiClient.myNewsFeed(path);
      _item.addAll(_newsFeed!.response.items);
      _profile.addAll(_newsFeed!.response.profiles);
      _groups.addAll(_newsFeed!.response.groups);
      errorTextNews = false;
      notifyListeners();
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionTipe.network:
          errorTextNews = true;
          notifyListeners();
          break;
      }
    }
  }

  Future<void> refreshListFeed() async {
    _item.clear();
    _profile.clear();
    _groups.clear();
    await loadNewsFeed('');
  }

  void showNextNewsFeed(int index, String url) async {
    if (index < _item.length - 1) return;
    loadNewsFeed(url);
  }
}
