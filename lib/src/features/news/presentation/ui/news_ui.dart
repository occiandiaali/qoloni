import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoloni/src/features/news/blocs/news_bloc.dart';
import 'package:qoloni/src/features/news/blocs/news_event.dart';
import 'package:qoloni/src/features/news/blocs/news_state.dart';
import 'package:qoloni/src/features/news/data/repos/repository.dart';

import '../../domain/models/story_model.dart';
import '../widgets/story_card.dart';

class NewsUI extends StatelessWidget {
  const NewsUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        RepositoryProvider.of<NewsRepo>(context),
      )..add(LoadNewsEvent()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Top Stories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black),),
          BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.deepOrangeAccent,),
                );
              }
              if (state is NewsLoadedState) {
                List<StoryModel> topStoryList = state.stories;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: topStoryList.length,
                      itemBuilder: (_, index) {
                        return StoryCard(
                          urlToImage: topStoryList[index].urlToImage,
                          publishedAt: topStoryList[index].publishedAt,
                          title: topStoryList[index].title,
                          url: topStoryList[index].url,

                        );
                      }),
                );
              }
              if (state is NewsErrorState) {
                return const Center(
                  child: Text("Oops! Something went wrong!"),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
