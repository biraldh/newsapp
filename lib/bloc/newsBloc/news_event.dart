part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class fetchNewsCategory extends NewsEvent{
  final String category;
  fetchNewsCategory(this.category);
}
