import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qoloni/src/features/news/presentation/widgets/news_card.dart';
import 'package:qoloni/src/features/news/presentation/widgets/news_category_button.dart';
import '../bloc/bloc.dart';
import './../../domain/models/article_model.dart';
import './../../data/repos/news_repository.dart';

class NewsArticles extends StatefulWidget {
  const NewsArticles({Key? key}) : super(key: key);

  @override
  State<NewsArticles> createState() => _NewsArticlesState();
}

class _NewsArticlesState extends State<NewsArticles> {
  String currentHeading = "topheadlines";
  int selectedButtonID = 0;
  String selectedCategory = "topheadlines"; // updated on button click
  List<bool> buttonStatus = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  void putOffOtherButtons(List<bool> buttonStatus) {
    for (int i = 0; i < buttonStatus.length; i++) {
      if (i != selectedButtonID) {
        buttonStatus[i] = false;
      }
    }
    buttonStatus[selectedButtonID] = true;
    if (selectedCategory[1] == 'o') {
      currentHeading = "topheadlines";
    } else {
      selectedCategory = currentHeading =
          selectedCategory[0].toUpperCase() + selectedCategory.substring(1);
    }
  }

  Widget buildArticles(BuildContext context, List<Article>? articles) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            padding: EdgeInsets.only(
              left: width * 0.025,
              right: width * 0.025,
              top: width * 0.01
            ),
              itemCount: articles!.length,
              itemBuilder: ((context, index) {
                return NewsCard(
                    height: height * 0.451,
                    width: width,
                    padding: width * 0.03,
                    author: articles[index].author,
                    title: articles[index].title,
                    description: articles[index].description,
                    url: articles[index].url,
                    urlToImage: articles[index].urlToImage,
                    content: articles[index].content,
                    publishedAt: articles[index].publishedAt);
              }),),
        ),
      ],
    );
  }

  final NewsRepository repository = NewsRepository();
  String selectedCountryEmoji = "";
  String selectedCountryCode = "ng";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          flex: 1,
            child: ListView(
              padding: EdgeInsets.only(
                bottom: width * 0.02,
                top: width * 0.02,
                left: width * 0.015,
                right: width * 0.015
              ),
              scrollDirection: Axis.horizontal,
              children: [
                NewsCategoryButton(
                    isSelected: buttonStatus[0],
                    category: "topheadlines",
                    country: selectedCountryCode,
                    buttonID: 0,
                  onClicked: (category, id) {
                      selectedButtonID = id;
                      selectedCategory = category;
                      putOffOtherButtons(buttonStatus);
                      setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[1],
                  category: "business",
                  country: selectedCountryCode,
                  buttonID: 1,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[2],
                  category: "entertainment",
                  country: selectedCountryCode,
                  buttonID: 2,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[3],
                  category: "general",
                  country: selectedCountryCode,
                  buttonID: 3,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[4],
                  category: "health",
                  country: selectedCountryCode,
                  buttonID: 4,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[5],
                  category: "science",
                  country: selectedCountryCode,
                  buttonID: 5,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[6],
                  category: "sports",
                  country: selectedCountryCode,
                  buttonID: 6,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
                NewsCategoryButton(
                  isSelected: buttonStatus[7],
                  category: "technology",
                  country: selectedCountryCode,
                  buttonID: 7,
                  onClicked: (category, id) {
                    selectedButtonID = id;
                    selectedCategory = category;
                    putOffOtherButtons(buttonStatus);
                    setState(() {});
                  },
                ),
              ],
            ),
        ),
        Expanded(
          flex: 14,
          child: BlocBuilder<NewsBloc, NewsState>(
            builder: (context, state) {
              if (state is NewsInitialState) {
                context.read<NewsBloc>()
                    .add(GetArticlesEvent(categoryName: 'topheadlines'));
              } else if (state is NewsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.deepOrange,),
                );
              } else if (state is NewsSuccessState) {
                return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<NewsBloc>(context).add(
                      GetArticlesEvent(
                        categoryName: selectedCategory,
                        countryName: selectedCountryCode
                      )
                    );
                  },
                  child: buildArticles(context, state.articles));
              } else if (state is NewsErrorState) {
                return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<NewsBloc>(context).add(
                          GetArticlesEvent(
                              categoryName: selectedCategory,
                              countryName: selectedCountryCode
                          )
                      );
                    },
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.error_outline),
                          Text("Connection Error!"),
                        ],
                      ),
                    ));
              }
              return const Center(child: Text("I don't know what happened!"));
            },
          ),
        ),
      ],
    );
  }
}
