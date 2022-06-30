import 'package:flutter/material.dart';
import 'package:vk_example/Inherited/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/friend_info/friend_info_model.dart';

class ProfileFriendsWidget extends StatelessWidget {
  const ProfileFriendsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileFriendsModel>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: () => model!.loadInfo(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}

class PhotoAndNameWidget extends StatelessWidget {
  final Map<String, dynamic>? map;
  const PhotoAndNameWidget({
    Key? key,
    this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileFriendsModel>(context);
    final info = model?.friendInfo?.response.first;
    final firstName = info?.facultyName;
    final lastName = info?.lastName;
    final photo = info?.photo_100 ?? '';
    return Row(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            child: photo != '' ? Image.network(photo) : const SizedBox.shrink(),
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
            const StatusProfileWidget()
          ],
        )
      ],
    );
  }
}

class StatusProfileWidget extends StatelessWidget {
  const StatusProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileFriendsModel>(context)
        ?.friendInfo
        ?.response
        .first;
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

class ProfileInfoWidget extends StatelessWidget {
  const ProfileInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? sex = '';
    final model = NotifierProvider.watch<ProfileFriendsModel>(context)
        ?.friendInfo
        ?.response
        .first;
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
      TextInfoWidget(textInfo: 'Пол', textGet: sex),
      TextInfoWidget(textInfo: 'Дата рождения', textGet: model?.bdate),
      TextInfoWidget(textInfo: 'Страна', textGet: model?.country?.title),
      TextInfoWidget(textInfo: 'Город', textGet: model?.city?.title),
      TextInfoWidget(textInfo: 'Интересы', textGet: model?.interests),
      TextInfoWidget(textInfo: 'Музыка', textGet: model?.music),
      TextInfoWidget(textInfo: 'Фильмы', textGet: model?.movies),
      TextInfoWidget(textInfo: 'Книги', textGet: model?.games),
    ]);
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
          const Divider(
            color: Colors.grey,
            height: 1,
          )
        ],
      ),
    );
  }
}

class PhotoViewWidget extends StatelessWidget {
  const PhotoViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = NotifierProvider.watch<ProfileFriendsModel>(context)
        ?.friendPhoto
        ?.response
        .items
        ?.length;
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
          itemCount: count ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: PhotoWidget(index: index),
            );
          }),
    );
  }
}

class PhotoWidget extends StatelessWidget {
  final int index;
  const PhotoWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<ProfileFriendsModel>(context)
            ?.friendPhoto
            ?.response
            .items?[index]
            .sizes?[2]
            .url ??
        '';
    final modelFoto = NotifierProvider.watch<ProfileFriendsModel>(context)
            ?.friendPhoto
            ?.response
            .items?[index]
            .sizes
            ?.last
            .url ??
        '';
    if (model == '' || modelFoto == '') return const SizedBox.shrink();
    return GestureDetector(
      child: Hero(
        tag: 'tag$index',
        child: Image.network(model),
      ),
      onTap: () {
        Navigator.push<DetailScreenWidget>(context,
            MaterialPageRoute(builder: (_) {
          return DetailScreenWidget(url: modelFoto);
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
