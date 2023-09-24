import 'package:flutter/material.dart';
import 'package:news_articles/domain/daily_news/entities/article.dart';

class ArticleCardWidget extends StatelessWidget {
  final ArticleEntity _articleEntity;
  const ArticleCardWidget({required ArticleEntity articleEntity, super.key})
      : _articleEntity = articleEntity;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            child: _articleEntity.urlToImage != null
                ? Image.network(_articleEntity.urlToImage ?? '')
                : const FlutterLogo(),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Text('${_articleEntity.title}'),
                Text(_articleEntity.description??''),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
