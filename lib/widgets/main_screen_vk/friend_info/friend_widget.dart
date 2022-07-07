import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/friend_info/friend_info.dart';
import 'package:vk_example/widgets/main_screen_vk/friend_info/friend_info_model.dart';

class FriendInfoWidget extends StatefulWidget {
  const FriendInfoWidget({Key? key}) : super(key: key);

  @override
  _FriendInfoWidgetState createState() => _FriendInfoWidgetState();
}

class _FriendInfoWidgetState extends State<FriendInfoWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<ProfileFriendsViewModel>().loadInfo();
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.white,
      child: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<ProfileFriendsViewModel>();
    final movieDetails = model.friendInfo;
    if (movieDetails == null) {
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return const ProfileFriendsWidget();
  }
}
