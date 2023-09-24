import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_articles/core/resources/data_state.dart';
import 'package:news_articles/domain/daily_news/entities/article.dart';
import 'package:news_articles/domain/daily_news/usecases/get_article_usecase.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  RemoteArticleBloc(this._getArticleUseCase) : super(RemoteArticleLoading()) {

    on<GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticleState> emit)async{
    final dataState = await _getArticleUseCase();
    if(dataState is DataSuccess &&  dataState.data!.isNotEmpty){
      emit(RemoteArticlesDone(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}

