import 'package:news_articles/core/resources/data_state.dart';
import 'package:news_articles/core/usecases/usecase.dart';
import 'package:news_articles/domain/daily_news/entities/article.dart';
import 'package:news_articles/domain/daily_news/repositories/article_repository.dart';

class GetArticleUseCase
    implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void param}) {
    return _articleRepository.getNewsArticle();
  }
}
