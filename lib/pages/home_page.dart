import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mynews_app/model/news_model.dart';
import 'package:mynews_app/providers/news_provider.dart';
import 'package:mynews_app/widgets/news_card.dart';
import 'package:mynews_app/widgets/search_field.dart';

class HomePage extends ConsumerWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    NewsModel news = ref.watch(newsProvider).newsModel;
    bool isLoading = ref.watch(newsProvider).isLoading;

    return Scaffold(
      backgroundColor: const Color(0xffF8F9FD),
      body: SafeArea(
          child:
          Column(
              children: [
                const SearchField(),
                isLoading ?
                SizedBox(
                  height: MediaQuery.of(context).size.height /2,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ): Expanded(
                  child: ListView.builder(
                    itemCount: news.articles!.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(article: news.articles![index]);
                    },
                  ),
                )
              ]
          )
      ),
    );
  }
}