import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/profile/profile_model.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final error = context.watch<ProfileViewModel>().errorTextProfile;
    if (error == true) {
      Future.microtask(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileData =
        context.select((ProfileViewModel value) => value.profileData);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${profileData.firstName} ${profileData.lastName}',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: profileData.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.read<ProfileViewModel>();
    return RefreshIndicator(
      onRefresh: () => model.loadProfileInfo(),
      child: const SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: _ProfileListInfoWidget(),
        ),
      ),
    );
  }
}

class _ProfileListInfoWidget extends StatelessWidget {
  const _ProfileListInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _PhotoAndNameWidget(),
        SizedBox(height: 15),
        _ProfileInfoWidget(),
        SizedBox(height: 15),
        Center(
          child: Text(
            'Фотографии',
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(height: 15),
        _PhotoListWidget(),
      ],
    );
  }
}

class _PhotoAndNameWidget extends StatelessWidget {
  const _PhotoAndNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData =
        context.select((ProfileViewModel value) => value.profileData);
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            child: profileData.photo.isNotEmpty
                ? Image.network(profileData.photo)
                : const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${profileData.firstName} ${profileData.lastName}',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _ProfileInfoWidget extends StatelessWidget {
  const _ProfileInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileData =
        context.select((ProfileViewModel value) => value.profileData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _TextInfoWidget(textInfo: 'Пол', textGet: profileData.sex),
        _TextInfoWidget(textInfo: 'Дата рождения', textGet: profileData.bdate),
        _TextInfoWidget(textInfo: 'Страна', textGet: profileData.country),
        _TextInfoWidget(textInfo: 'Город', textGet: profileData.city),
        _TextInfoWidget(textInfo: 'Интересы', textGet: profileData.interests),
        _TextInfoWidget(textInfo: 'Музыка', textGet: profileData.music),
        _TextInfoWidget(textInfo: 'Фильмы', textGet: profileData.movies),
        _TextInfoWidget(textInfo: 'Книги', textGet: profileData.games),
      ],
    );
  }
}

class _TextInfoWidget extends StatelessWidget {
  final String? textInfo;
  final String? textGet;

  const _TextInfoWidget(
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

class _PhotoListWidget extends StatelessWidget {
  const _PhotoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friendPhoto =
        context.select((ProfileViewModel value) => value.friendPhoto);
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
              child: _PhotoWidget(index: index),
            );
          }),
    );
  }
}

class _PhotoWidget extends StatelessWidget {
  final int index;
  const _PhotoWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final minPhotoUrl =
        context.select((ProfileViewModel value) => value.minPhotoUrl(index));
    final maxPhotoUrl =
        context.select((ProfileViewModel value) => value.maxPhotoUrl(index));
    return GestureDetector(
      child: Hero(
        tag: 'tag$index',
        child: Image.network(minPhotoUrl),
      ),
      onTap: () {
        Navigator.push<FullScreenPhotoWidget>(
          context,
          MaterialPageRoute(
            builder: (_) {
              return FullScreenPhotoWidget(url: maxPhotoUrl);
            },
          ),
        );
      },
    );
  }
}

class FullScreenPhotoWidget extends StatelessWidget {
  final String url;
  const FullScreenPhotoWidget({Key? key, required this.url}) : super(key: key);

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
            child: InteractiveViewer(
              maxScale: 2,
              minScale: 1,
              child: Image.network(url),
            ),
          ),
        ),
      ),
    );
  }
}
