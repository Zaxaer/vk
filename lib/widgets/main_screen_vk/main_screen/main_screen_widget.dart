import 'package:flutter/material.dart';
import 'package:vk_example/domain/factory/screen_factory.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({
    Key? key,
  }) : super(key: key);
  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;
  static final _screenFactory = ScreenFactory();

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgetBody = <Widget>[
    _screenFactory.makeNewsFeed(),
    _screenFactory.makeMyListFriend(),
    _screenFactory.makeProfile(),
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
