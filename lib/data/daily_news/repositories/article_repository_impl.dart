import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_articles/core/constant/constants.dart';
import 'package:news_articles/core/resources/data_state.dart';
import 'package:news_articles/data/daily_news/data_sources/remote/news_api_service.dart';
import 'package:news_articles/data/daily_news/models/article_model.dart';
import 'package:news_articles/domain/daily_news/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        category: categoryQuery,
        country: countryQuery,
      );
      print('httpresponse: ${httpResponse.response.statusCode}');
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }
}
