part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

final class RemoteArticleInitial extends RemoteArticleState {}

final class RemoteArticleLoading extends RemoteArticleState {}

final class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleEntity> articles)
      : super(articles: articles);
}

final class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException exception)
      : super(exception: exception);
}
