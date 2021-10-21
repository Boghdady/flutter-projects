import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/bloc_Provider.dart';
import 'package:hacker_news/src/blocs/stories_bloc.dart';

class Refresh extends StatelessWidget {
  final Widget child;

  Refresh({this.child});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StoriesBloc>(context);
    return RefreshIndicator(
      child: child,
      // progress finish after clear and fetch
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}
