import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    final error = context.watch<ProfileFriendsViewModel>().errorTextFriendInfo;
    if (error == true) {
      Future.microtask(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileFriendsData = context
        .select((ProfileFriendsViewModel value) => value.profileFriendsData);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.blue,
      ),
      body: profileFriendsData.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const ProfileFriendsWidget(),
    );
  }
}

class ProfileFriendsWidget extends StatelessWidget {
  const ProfileFriendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileFriendsViewModel>();
    return RefreshIndicator(
      onRefresh: () => model.loadFriendInfo(),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: const [
              PhotoAndNameWidget(),
              SizedBox(height: 15),
              ProfileInfoWidget(),
              SizedBox(height: 15),
              Center(
                  child: Text(
                'Фотографии',
                style: TextStyle(fontSize: 20),
              )),
              SizedBox(height: 15),
              PhotoViewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class PhotoAndNameWidget extends StatelessWidget {
  const PhotoAndNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileFriendsData = context
        .select((ProfileFriendsViewModel value) => value.profileFriendsData);
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            child: profileFriendsData.photo.isNotEmpty
                ? Image.network(profileFriendsData.photo)
                : const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${profileFriendsData.firstName} ${profileFriendsData.lastName}',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(height: 10),
          ],
        )
      ],
    );
  }
}

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileFriendsData = context
        .select((ProfileFriendsViewModel value) => value.profileFriendsData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextInfoWidget(textInfo: 'Пол', textGet: profileFriendsData.sex),
        TextInfoWidget(
            textInfo: 'Дата рождения', textGet: profileFriendsData.bdate),
        TextInfoWidget(textInfo: 'Страна', textGet: profileFriendsData.country),
        TextInfoWidget(textInfo: 'Город', textGet: profileFriendsData.city),
        TextInfoWidget(
            textInfo: 'Интересы', textGet: profileFriendsData.interests),
        TextInfoWidget(textInfo: 'Музыка', textGet: profileFriendsData.music),
        TextInfoWidget(textInfo: 'Фильмы', textGet: profileFriendsData.movies),
        TextInfoWidget(textInfo: 'Книги', textGet: profileFriendsData.games),
      ],
    );
  }
}

class TextInfoWidget extends StatelessWidget {
  final String? textInfo;
  final String? textGet;

  const TextInfoWidget(
      {Key? key, required this.textInfo, required this.textGet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (textGet == null || textGet == '') return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '$textInfo: $textGet',
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}

class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friendPhoto =
        context.select((ProfileFriendsViewModel value) => value.friendPhoto);
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 2, color: Colors.blue),
            top: BorderSide(width: 2, color: Colors.blue)),
      ),
      height: 400,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: friendPhoto?.response.items?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: PhotoWidget(index: index),
          );
        },
      ),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  final int index;
  const PhotoWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minPhotoUrl = context
        .select((ProfileFriendsViewModel value) => value.minPhotoUrl(index));
    final maxPhotoUrl = context
        .select((ProfileFriendsViewModel value) => value.maxPhotoUrl(index));
    return GestureDetector(
      child: Hero(
        tag: 'tag$index',
        child: minPhotoUrl != ''
            ? Image.network(minPhotoUrl)
            : const SizedBox.shrink(),
      ),
      onTap: () {
        Navigator.push<DetailScreenWidget>(context,
            MaterialPageRoute(builder: (_) {
          return DetailScreenWidget(url: maxPhotoUrl);
        }));
      },
    );
  }
}

class DetailScreenWidget extends StatelessWidget {
  final String url;
  const DetailScreenWidget({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Hero(
            tag: 'tag',
            child: url != '' ? Image.network(url) : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
