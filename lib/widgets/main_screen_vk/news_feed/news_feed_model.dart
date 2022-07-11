import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vk_example/domain/api_client/api_client_exaption.dart';
import 'package:vk_example/domain/entity/new_feed.dart';
import 'package:vk_example/domain/services/data_service.dart';
import 'package:vk_example/navigation/main_navigation.dart';

class NewsFeedItemData {
  bool isLoading = true;
  String nextForm = '';
  int lenght = 0;
  String photo = '';
  String likeCount = '';
  String mainText = '';
  int sourceId = 0;
  String data = '';
  NewsFeedProfileData newsFeedProfileData = NewsFeedProfileData();
  NewsFeedGroupsData newsFeedGroupsData = NewsFeedGroupsData();
}

class NewsFeedProfileData {
  String photo = '';
  String postName = '';
}

class NewsFeedGroupsData {
  String photo = '';
  String postName = '';
}

class NewsFeedWidgetViewModel extends ChangeNotifier {
  final newsFeedData = NewsFeedItemData();
  final _dataService = DataService();
  final _item = <Item>[];
  final _profile = <Profile>[];
  final _groups = <Group>[];
  var errorTextNews = false;
  int _mainIndex = -1;

  NewsFeedWidgetViewModel() {
    loadNewsFeed('');
  }

  Future<void> loadNewsFeed(String path) async {
    try {
      final newsFeed = await _dataService.loadNewsFeed(path);
      _update(newsFeed);
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

  void _update(NewsFeed? newsFeed) {
    newsFeedData.isLoading = newsFeed == null;
    if (newsFeed == null) {
      notifyListeners();
      return;
    }
    _item.addAll(newsFeed.response.items);
    _profile.addAll(newsFeed.response.profiles);
    _groups.addAll(newsFeed.response.groups);
    newsFeedData.nextForm = newsFeed.response.nextFrom;
    newsFeedData.lenght = newsFeed.response.items.length;
    notifyListeners();
  }

  void postListDownload() {
    if (newsFeedData.sourceId > 0) {
      final postProfile = _profile;
      final profileList = postProfile
          .where((element) => element.id == newsFeedData.sourceId)
          .toList();
      newsFeedData.newsFeedProfileData.photo = profileList.first.photo_50 ?? '';
      newsFeedData.newsFeedProfileData.postName =
          profileList.first.firstName ?? '';
    } else {
      final postGroup = _groups;
      final groupList = postGroup
          .where((element) => (element.id! * (-1)) == newsFeedData.sourceId)
          .toList();
      newsFeedData.newsFeedGroupsData.photo = groupList.first.photo_50 ?? '';
      newsFeedData.newsFeedGroupsData.postName = groupList.first.name ?? '';
    }
  }

  void indexUpdate() {
    postFormatter();
  }

  void postFormatter() {
    final item = _item[_mainIndex];
    newsFeedData.mainText = item.text ?? '';

    final image =
        item.attachments?.where((element) => element.type == 'photo').toList();
    if (image == null || image.isEmpty) {
      newsFeedData.photo = '';
    } else {
      newsFeedData.photo = image.first.photo?.sizes?.last.url ?? '';
    }
    newsFeedData.likeCount = item.likes?.count.toString() ?? '';
    newsFeedData.sourceId = item.sourceId ?? 0;
    final dateFormat = (item.date ?? 0) * 1000;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(dateFormat);
    newsFeedData.data = DateFormat('dd/MM/yyyy, HH:mm').format(dateTime);
    postListDownload();
  }

  Future<void> refreshListFeed() async {
    _item.clear();
    _profile.clear();
    _groups.clear();
    await loadNewsFeed('');
  }

  void showNextNewsFeed(int index, String url) async {
    _mainIndex = index;
    indexUpdate();
    if (index < _item.length - 1) return;
    loadNewsFeed(url);
  }

  void exitAuthScreen(BuildContext context) {
    _dataService.exitAccount();
    Navigator.pushNamedAndRemoveUntil(
        context, MainNavigationRouteNames.loaderWidget, (route) => false);
  }
}
