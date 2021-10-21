import 'package:flutter/material.dart';
import 'package:hacker_news/src/blocs/bloc_Provider.dart';
import 'package:hacker_news/src/widgets/list_item.dart';
import 'package:hacker_news/src/widgets/refresh_list_view.dart';
import '../blocs/stories_bloc.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<StoriesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(StoriesBloc bloc) {
    return StreamBuilder(
        stream: bloc.topIds,
        builder: (context, AsyncSnapshot<List<int>> snapshot) {
          print('number of fetched ids = ${snapshot.data.length}');
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Refresh(
            child: ListView.builder(
              itemBuilder: (context, index) {
                // Try to do pagination here
                bloc.fetchItem(snapshot.data[index]);
                return ListItem(
                  itemId: snapshot.data[index],
                );
              },
              itemCount: snapshot.data.length,
            ),
          );
        });
  }
}
