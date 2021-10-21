import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/home_tabs/favourite.dart';
import 'package:flutter_news_app/screens/home_tabs/popular.dart';
import 'package:flutter_news_app/screens/home_tabs/whats_new.dart';
import 'package:flutter_news_app/shared_ui/navigation_drawer.dart';
import 'package:flutter_news_app/shared_ui/popup_menu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenu(),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text: "WHAT'S NEW"),
            Tab(text: "POPULAR"),
            Tab(text: "FAVOURITES"),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: TabBarView(
          children: [
            WhatsNew(),
            Popular(),
            Favourite(),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
