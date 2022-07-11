import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friend_model.dart';
import 'package:vk_example/widgets/main_screen_vk/list_friend/list_friends_widget.dart';

class AllMyFriendsWidget extends StatelessWidget {
  const AllMyFriendsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MyListFriendViewModel>();
    return RefreshIndicator(
      onRefresh: () => model.loadProfileListFriend(),
      child: ColoredBox(
        color: const Color(0xffEBEDF0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: model.listFriend.length,
          itemBuilder: (BuildContext context, int index) {
            return AllFriendInfoWidget(index: index);
          },
        ),
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
    final model = context.read<MyListFriendViewModel>();
    final listFriend = model.listFriend[index];
    return Stack(
      children: [
        Card(
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: ClipRRect(
                  child: listFriend.photo != ''
                      ? Image.network(listFriend.photo)
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
                        text: '${listFriend.firstName} ${listFriend.lastName}'),
                    const SizedBox(height: 10),
                    StatusProfileWidget(index: index),
                  ],
                ),
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
              onTap: () => model.onFriendInfo(context, listFriend.id),
            ),
          ),
        )
      ],
    );
  }
}
