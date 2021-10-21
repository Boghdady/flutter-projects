import 'package:flutter/material.dart';
import 'package:hacker_news/src/screens/news_list.dart';

import 'blocs/bloc_Provider.dart';
import 'blocs/stories_bloc.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StoriesBloc>(
      bloc: StoriesBloc(),
      child: MaterialApp(
        title: 'HackersNews',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NewsList(),
      ),
    );
  }
}
