import 'package:flutter/material.dart';
import 'package:flutter_news_app/models/navigation_menu_item.dart';
import 'package:flutter_news_app/screens/facebook_feeds.dart';
import 'package:flutter_news_app/screens/headline_news.dart';
import 'package:flutter_news_app/screens/home_screen.dart';
import 'package:flutter_news_app/screens/instgram_feeds.dart';
import 'package:flutter_news_app/screens/login.dart';
import 'package:flutter_news_app/screens/twitter_feeds.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavigationItem> navigationItems = [
    NavigationItem("Explore", () => HomePage()),
    NavigationItem("Headline News", () => HeadlineNews()),
    NavigationItem("Twitter Feeds", () => TwitterFeeds()),
    NavigationItem("Instgram Feeds", () => InstgramFeeds()),
    NavigationItem("Facebook Feeds", () => FacebookFeeds()),
    NavigationItem("Login", () => Login()),
  ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 75),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              title: Text(
                navigationItems[position].title,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
              contentPadding: EdgeInsets.only(top: 10, left: 24, right: 24),
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey.shade400,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          navigationItems[position].destination()),
                );
              },
            );
          },
          itemCount: navigationItems.length,
        ),
      ),
    );
  }
}
