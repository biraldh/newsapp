part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}


class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel news;
  NewsLoaded(this.news);

}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);
}