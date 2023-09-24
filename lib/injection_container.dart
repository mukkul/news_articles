import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_articles/data/daily_news/data_sources/remote/news_api_service.dart';
import 'package:news_articles/data/daily_news/repositories/article_repository_impl.dart';
import 'package:news_articles/domain/daily_news/repositories/article_repository.dart';
import 'package:news_articles/domain/daily_news/usecases/get_article_usecase.dart';
import 'package:news_articles/presentation/daily_news/blocs/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());
  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  //repositories
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //blocs
  sl.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
}
