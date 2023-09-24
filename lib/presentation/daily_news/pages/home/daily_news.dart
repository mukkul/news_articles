import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_articles/presentation/daily_news/blocs/remote/bloc/remote_article_bloc.dart';
import 'package:news_articles/presentation/daily_news/widgets/article_card_widget.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (context, state) {
        debugPrint('article state: ${state.runtimeType}');
        if (state is RemoteArticleLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RemoteArticlesError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is RemoteArticlesDone) {
          return ListView.builder(
            itemCount: state.articles!.length,
            itemBuilder: (context, index) {
              return ArticleCardWidget(articleEntity: state.articles![index]);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
