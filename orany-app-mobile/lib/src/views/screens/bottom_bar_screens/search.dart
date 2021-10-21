import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/dev-data/categories.dart';
import 'package:orany_app/src/views/shared/main_screens_app_bar.dart';
import 'package:orany_app/src/views/widgets/search/match_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: MainScreensAppBar(
        title: 'بحث',
        iconData: Icons.filter_list,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0, right: 8.0),
        child: GridView.builder(
            itemCount: categories.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              Map cat = categories[index];
              return MatchCard(cat: cat);
            }),
      ),
    );
  }
}

// Directionality
