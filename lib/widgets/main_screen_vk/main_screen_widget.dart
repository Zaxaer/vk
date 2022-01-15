import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friend_model.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friends_widget.dart';
import 'package:vk_example/widgets/main_screen_vk/news_feed/news_feed_model.dart';
import 'package:vk_example/widgets/main_screen_vk/news_feed/news_feed_widget.dart';
import 'package:vk_example/widgets/main_screen_vk/profile/profile_widget.dart';
import 'package:vk_example/widgets/main_screen_vk/profile/profile_model.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({
    Key? key,
  }) : super(key: key);
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;
  static final infoLoad = ProfileModel();
  static final listFriends = MyListFriendModel();
  static final newsFeed = NewsFeedWidgetModel();

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    infoLoad.loadInfo();
    listFriends.loadListFriend();
    newsFeed.loadNewsFeed('');
  }

  final List<Widget> _widgetBody = <Widget>[
    NotifierProvider(
      child: const NewsFeedWidget(),
      model: newsFeed,
    ),
    NotifierProvider(
      child: const MyListFriendWidget(),
      model: listFriends,
    ),
    NotifierProvider(
      child: const ProfileScreenWidget(),
      model: infoLoad,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetBody.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Друзья',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ));
  }
}
