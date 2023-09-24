import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_articles/config/theme/app_theme.dart';
import 'package:news_articles/presentation/daily_news/blocs/remote/bloc/remote_article_bloc.dart';
import 'package:news_articles/presentation/daily_news/pages/home/daily_news.dart';

import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) =>sl()..add(GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
