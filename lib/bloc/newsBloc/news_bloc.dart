import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../model/NewsModel.dart';
import '../../services/News_Services.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async {
      if (event is fetchNewsCategory) {
        log("bloc");
        emit(NewsLoading());
        try {
          final NewsModel news = await fetchNewsbyCategory(event.category) as NewsModel;
          emit(NewsLoaded(news));
        } catch (e) {
          emit(NewsError('Failed to load news: $e'));
        }
      }
    });
  }
}

