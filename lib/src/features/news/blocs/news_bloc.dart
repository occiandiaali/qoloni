import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repos/repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepo _newsRepo;

  NewsBloc(this._newsRepo) : super(NewsLoadingState()) {
 // NewsBloc() : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final topNews = await _newsRepo.getTopNews();
        emit(NewsLoadedState(topNews));
      } catch (e) {
        emit(NewsErrorState(e.toString()));
      }
    });
  }
}

