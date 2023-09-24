import 'package:news_articles/domain/daily_news/entities/article.dart';

class ArticleModel extends ArticleEntity{
  final int? id;
  final String? auther;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;
 
 const ArticleModel({
    this.id,
    this.auther,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });

 factory ArticleModel.fromJson(Map<String, dynamic> map){
  return ArticleModel(
    auther: map['auther'] ?? '',
    title: map['title'] ?? '',
    content: map['content'] ?? '',
  );
 } 
}