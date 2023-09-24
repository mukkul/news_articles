import 'package:news_articles/core/constant/constants.dart';
import 'package:news_articles/data/daily_news/models/article_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsApiBaseURl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query('apiKey') String? apiKey,
    @Query('country') String? country,
    @Query('category') String? category,
  });
}
