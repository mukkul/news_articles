import 'package:equatable/equatable.dart';

class ArticleEntity extends Equatable {
  final int? id;
  final String? auther;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? content;

  const ArticleEntity({
    this.id,
    this.auther,
    this.content,
    this.description,
    this.title,
    this.url,
    this.urlToImage,
  });
  
  @override
  List<Object?> get props => [
    id, auther, content, description, title, url, urlToImage
  ];
}
