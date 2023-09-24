import 'package:news_articles/core/resources/data_state.dart';
import 'package:news_articles/domain/daily_news/entities/article.dart';

abstract class ArticleRepository {
 
  Future<DataState<List<ArticleEntity>>> getNewsArticle();

}