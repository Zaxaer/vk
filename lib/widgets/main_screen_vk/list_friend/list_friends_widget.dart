import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friend_model.dart';
import 'package:vk_example/widgets/theme/style.dart';

class MyListFriendWidget extends StatefulWidget {
  const MyListFriendWidget({Key? key}) : super(key: key);
  static const List<Tab> myTabs = <Tab>[
    Tab(child: Text('Все друзья')),
    Tab(child: Text('Онлайн')),
  ];
  static List<Widget> bodyTabs = <Widget>[
    const Tab(child: AllMyFriendsWidget()),
    const Tab(child: OnlineMyFriendsWidget()),
  ];

  @override
  State<MyListFriendWidget> createState() => _MyListFriendWidgetState();
}

class _MyListFriendWidgetState extends State<MyListFriendWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final error =
        NotifierProvider.watch<MyListFriendModel>(context)?.errorTextListFriend;
    if (error == true) {
      Future.microtask(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MyListFriendWidget.myTabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBar(
                title: Text(
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
                  tabs: MyListFriendWidget.myTabs,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: MyListFriendWidget.bodyTabs,
          ),
        ),
      ),
    );
  }
}

final _style = ColorStyleAuth();

class AllMyFriendsWidget extends StatelessWidget {
  const AllMyFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MyListFriendModel>(context);
    return Container(
      color: _style.greyBackGroundWidgetColor,
      child: RefreshIndicator(
        onRefresh: () => model!.loadListFriend(),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: model?.myFriendList?.response.count ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return AllFriendInfoWidget(
                index: index,
              );
            }),
      ),
    );
  }
}

class OnlineMyFriendsWidget extends StatelessWidget {
  const OnlineMyFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MyListFriendModel>(context);
    final friendonlineList = model?.myFriendList?.response.items
        .where((element) => element.online == 1)
        .toList();
    return Container(
      color: _style.greyBackGroundWidgetColor,
      child: RefreshIndicator(
        onRefresh: () => model!.loadListFriend(),
        child: ListView.builder(
            itemCount: friendonlineList?.length ?? 0,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return FriendInfoOnlineWidget(
                index: index,
              );
            }),
      ),
    );
  }
}

class AllFriendInfoWidget extends StatelessWidget {
  final int index;
  const AllFriendInfoWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MyListFriendModel>(context);
    final _photo = model?.myFriendList?.response.items[index].photo_100 ?? '';
    final _firstName = model?.myFriendList?.response.items[index].first_name;
    final _lastName = model?.myFriendList?.response.items[index].last_name;
    final userId = model?.myFriendList?.response.items[index].id ?? 87473106;
    return Stack(
      children: [
        Card(
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  child: _photo != ''
                      ? Image.network(_photo)
                      : const SizedBox.shrink(),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFriendInfoWidget(text: '$_firstName $_lastName'),
                      const SizedBox(height: 10),
                      StatusProfileWidget(index: index),
                    ]),
              )
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: 0,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () => model?.onFriendInfo(context, userId),
            ),
          ),
        )
      ],
    );
  }
}

class FriendInfoOnlineWidget extends StatelessWidget {
  final int index;
  const FriendInfoOnlineWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MyListFriendModel>(context);
    final friendonlineList = model?.myFriendList?.response.items
        .where((element) => element.online == 1)
        .toList();
    final _photo = friendonlineList![index].photo_100 ?? '';
    final _firstName = friendonlineList[index].first_name;
    final _lastName = friendonlineList[index].last_name;
    final userId = friendonlineList[index].id ?? 87473106;
    return Stack(children: [
      Card(
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                child: _photo != ''
                    ? Image.network(_photo)
                    : const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFriendInfoWidget(text: '$_firstName $_lastName'),
                    const SizedBox(height: 10),
                    StatusProfileOnlineWidget(index: index),
                  ]),
            )
          ],
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        top: 0,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () => model?.onFriendInfo(context, userId),
          ),
        ),
      )
    ]);
  }
}

class TextFriendInfoWidget extends StatelessWidget {
  final String text;
  const TextFriendInfoWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
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
    final model = NotifierProvider.watch<MyListFriendModel>(context);
    if (model?.myFriendList?.response.items[index].online == 0) {
      return const Text(
        'Offline',
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 18, color: Colors.grey),
      );
    }
    return const Text(
      'Online',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 18, color: Colors.blue),
    );
  }
}

class StatusProfileOnlineWidget extends StatelessWidget {
  final int index;
  const StatusProfileOnlineWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Online',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 18, color: Colors.blue),
    );
  }
}
