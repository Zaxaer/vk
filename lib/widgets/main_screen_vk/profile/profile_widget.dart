import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/profile/profile_model.dart';

class ProfileScreenWidget extends StatelessWidget {
  const ProfileScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context);
    final info = model?.userInfo?.response.first;
    final firstName = info?.first_name ?? '';
    final lastName = info?.last_name ?? '';
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(color: Colors.blue),
        title: Text(
          '$firstName $lastName',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => model!.loadInfo(),
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: ProfileListInfo(),
          ),
        ),
      ),
    );
  }
}

class ProfileListInfo extends StatelessWidget {
  const ProfileListInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context);
    if (model!.errorTextProfile == true) {
      return const SizedBox(
        height: 1000,
        width: double.infinity,
        child: Text(
          'Ошибка соединения. Потяните вниз',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        PhotoAndName(),
        SizedBox(height: 15),
        ProfileInfo(),
        SizedBox(height: 15),
        Center(
            child: Text(
          'Фотографии',
          style: TextStyle(fontSize: 20),
        )),
        SizedBox(height: 15),
        PhotoView(),
      ],
    );
  }
}

class PhotoAndName extends StatelessWidget {
  final Map<String, dynamic>? map;
  const PhotoAndName({
    Key? key,
    this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context);
    final info = model?.userInfo?.response.first;
    final firstName = info?.first_name ?? '';
    final lastName = info?.last_name ?? '';
    final photo = info?.photo_100;
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            child:
                photo != null ? Image.network(photo) : const SizedBox.shrink(),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstName $lastName',
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(height: 10),
            const StatusProfile()
          ],
        )
      ],
    );
  }
}

class StatusProfile extends StatelessWidget {
  const StatusProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model =
        NotifierProvider.watch<ProfileModel>(context)?.userInfo?.response.first;
    if (model?.online == 0) {
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

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? sex = '';
    final model =
        NotifierProvider.watch<ProfileModel>(context)?.userInfo?.response.first;
    switch (model?.sex) {
      case (1):
        sex = 'Жениский';
        break;
      case (2):
        sex = 'Мужской';
        break;
      case (0):
        sex = 'Не выбран';
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      TextInfo(textInfo: 'Пол', textGet: sex),
      TextInfo(textInfo: 'Дата рождения', textGet: model?.bdate),
      TextInfo(textInfo: 'Страна', textGet: model?.country?.title),
      TextInfo(textInfo: 'Город', textGet: model?.city?.title),
      TextInfo(textInfo: 'Интересы', textGet: model?.interests),
      TextInfo(textInfo: 'Музыка', textGet: model?.music),
      TextInfo(textInfo: 'Фильмы', textGet: model?.movies),
      TextInfo(textInfo: 'Книги', textGet: model?.games),
    ]);
  }
}

class TextInfo extends StatelessWidget {
  final String? textInfo;
  final String? textGet;

  const TextInfo({Key? key, required this.textInfo, required this.textGet})
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
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}

class PhotoView extends StatelessWidget {
  const PhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context);
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
          itemCount: model?.userPhoto?.response.count ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Photo(index: index),
            );
          }),
    );
  }
}

class Photo extends StatelessWidget {
  final int index;
  const Photo({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileModel>(context)
            ?.userPhoto
            ?.response
            .items?[index]
            .sizes?[2]
            .url ??
        '';
    final modelMax = NotifierProvider.watch<ProfileModel>(context)
            ?.userPhoto
            ?.response
            .items?[index]
            .sizes?[6]
            .url ??
        '';

    return GestureDetector(
      child: Hero(
        tag: 'tag$index',
        child: Image.network(model),
      ),
      onTap: () {
        Navigator.push<DetailScreen>(context, MaterialPageRoute(builder: (_) {
          return DetailScreen(url: modelMax);
        }));
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String url;
  const DetailScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: GestureDetector(
        child: Container(
          color: Colors.black,
          child: Center(
            child: Hero(
              tag: 'tag',
              child: Image.network(url),
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
