import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friend_model.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friends_widget.dart';

class OnlineMyFriendsWidget extends StatelessWidget {
  const OnlineMyFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MyListFriendViewModel>();
    return Container(
      color: const Color(0xffEBEDF0),
      child: RefreshIndicator(
        onRefresh: () => model.loadProfileListFriend(),
        child: ListView.builder(
            itemCount: model.onlineFriendInfo().length,
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

class FriendInfoOnlineWidget extends StatelessWidget {
  final int index;
  const FriendInfoOnlineWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MyListFriendViewModel>();
    final friendonlineList = model.onlineFriendInfo()[index];
    return Stack(children: [
      Card(
        child: Row(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                child: friendonlineList.photo != ''
                    ? Image.network(friendonlineList.photo)
                    : const SizedBox.shrink(),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFriendInfoWidget(
                        text:
                            '${friendonlineList.firstName} ${friendonlineList.lastName}'),
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
            onTap: () => model.onFriendInfo(context, friendonlineList.id),
          ),
        ),
      )
    ]);
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
