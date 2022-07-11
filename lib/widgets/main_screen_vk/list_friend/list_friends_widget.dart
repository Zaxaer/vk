import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/all_list_friend.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friend_model.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/online_friend_list.dart';

class MyListFriendWidget extends StatefulWidget {
  const MyListFriendWidget({Key? key}) : super(key: key);

  @override
  State<MyListFriendWidget> createState() => _MyListFriendWidgetState();
}

class _MyListFriendWidgetState extends State<MyListFriendWidget> {
  static List<Widget> bodyTabs = <Widget>[
    const Tab(
      child: AllMyFriendsWidget(),
    ),
    const Tab(
      child: OnlineMyFriendsWidget(),
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final error = context.watch<MyListFriendViewModel>().errorTextListFriend;
    if (error == true) {
      Future.microtask(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = context.read<MyListFriendViewModel>().tabData;
    return DefaultTabController(
      length: tabs.myTabs.length,
      child: Scaffold(
        backgroundColor: const Color(0xffEBEDF0),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: const Text(
                  'Друзья',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.blue,
                  isScrollable: true,
                  tabs: tabs.myTabs,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: bodyTabs,
          ),
        ),
      ),
    );
  }
}

class TextFriendInfoWidget extends StatelessWidget {
  final String text;
  const TextFriendInfoWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
      overflow: TextOverflow.fade,
      softWrap: false,
      maxLines: 1,
    );
  }
}

class StatusProfileWidget extends StatelessWidget {
  final int index;
  const StatusProfileWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final status = context.watch<MyListFriendViewModel>().status(index);
    if (status == 0) {
      return const Text(
        'Offline',
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: Colors.grey,
        ),
      );
    }
    return const Text(
      'Online',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: Colors.blue,
      ),
    );
  }
}
