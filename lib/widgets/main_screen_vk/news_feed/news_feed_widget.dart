import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vk_example/widgets/main_screen_vk/news_feed/news_feed_model.dart';

class NewsFeedWidget extends StatefulWidget {
  const NewsFeedWidget({Key? key}) : super(key: key);

  @override
  State<NewsFeedWidget> createState() => _NewsFeedWidgetState();
}

class _NewsFeedWidgetState extends State<NewsFeedWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final error = context.watch<NewsFeedWidgetViewModel>().errorTextNews;
    if (error == true) {
      Future.microtask(() => ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('error'))));
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = context.read<NewsFeedWidgetViewModel>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Новости',
            style: TextStyle(color: Colors.blue),
          ),
          actions: [
            TextButton(
              child: const Text('Выход'),
              onPressed: () => model.exitAuthScreen(context),
            ),
          ]),
      body: model.newsFeedData.isLoading
          ? const Center(child: CircularProgressIndicator())
          : const LentaScrollViewWidget(),
    );
  }
}

class LentaScrollViewWidget extends StatelessWidget {
  const LentaScrollViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NewsFeedWidgetViewModel>();
    final newsFeedData =
        context.select((NewsFeedWidgetViewModel value) => value.newsFeedData);
    return RefreshIndicator(
      onRefresh: () => model.refreshListFeed(),
      child: ListView.builder(
        itemCount: newsFeedData.lenght,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          model.showNextNewsFeed(index, newsFeedData.nextForm);
          return NewsFeedPostWidget(
            index: index,
          );
        },
      ),
    );
  }
}

class NewsFeedPostWidget extends StatelessWidget {
  final int index;
  const NewsFeedPostWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsFeedData =
        context.select((NewsFeedWidgetViewModel value) => value.newsFeedData);
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: PostNameWidget(index: index),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  newsFeedData.mainText,
                  style: const TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        ImageNewsFeedWidget(url: newsFeedData.photo),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 10),
            const Icon(
              Icons.favorite_border,
              size: 35,
              color: Colors.grey,
            ),
            const SizedBox(width: 10),
            Text(
              (newsFeedData.likeCount),
              style: const TextStyle(color: Colors.grey, fontSize: 25),
            ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 10),
        const SizedBox(height: 10)
      ],
    );
  }
}

class ImageNewsFeedWidget extends StatelessWidget {
  final String url;
  const ImageNewsFeedWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (url == '') return const SizedBox.shrink();
    return Image.network(url);
  }
}

class PostNameWidget extends StatelessWidget {
  final int index;
  const PostNameWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsFeedData =
        context.select((NewsFeedWidgetViewModel value) => value.newsFeedData);
    if (newsFeedData.sourceId > 0) {
      return Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              child: newsFeedData.newsFeedProfileData.photo != ''
                  ? Image.network(newsFeedData.newsFeedProfileData.photo)
                  : const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(newsFeedData.newsFeedProfileData.postName),
            const SizedBox(height: 10),
          ])
        ],
      );
    } else {
      return Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: ClipRRect(
              child: newsFeedData.newsFeedGroupsData.photo != ''
                  ? Image.network(newsFeedData.newsFeedGroupsData.photo)
                  : const SizedBox.shrink(),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(newsFeedData.newsFeedGroupsData.postName),
            const SizedBox(height: 10),
            Text(newsFeedData.data),
          ])
        ],
      );
    }
  }
}
