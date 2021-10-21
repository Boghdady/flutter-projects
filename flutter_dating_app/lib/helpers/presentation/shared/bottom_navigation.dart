import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/chat/presentation/pages/chat_page.dart';
import 'package:flutterdatingapp/features/discover/presentation/pages/discover_page.dart';
import 'package:flutterdatingapp/features/more/presentation/pages/more_page.dart';
import 'package:flutterdatingapp/features/notification/presentation/pages/notification_page.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/custom_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  Widget _currentPage = DiscoverPage();
  List<Widget> _pages = [
    DiscoverPage(),
    ChatPage(),
    NotificationPage(),
    MorePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: _selectedTab,
        color: Colors.grey,
        selectedColor: Colors.teal,
        notchedShape: CircularNotchedRectangle(),
        items: [
          BottomAppBarItem(
            iconData: Icons.search,
            text: getTranslated(context, 'btn_nav_bar_item_discover'),
          ),
          BottomAppBarItem(
            iconData: Icons.chat_bubble,
            text: getTranslated(context, 'btn_nav_bar_item_chat'),
          ),
          BottomAppBarItem(
            iconData: Icons.account_circle,
            text: getTranslated(context, 'btn_nav_bar_item_notification'),
          ),
          BottomAppBarItem(
            iconData: Icons.more_horiz,
            text: getTranslated(context, 'btn_nav_bar_item_more'),
          ),
        ],
      ),
    );
  }

  void _selectedTab(int index) {
    setState(() {
      _currentPage = _pages[index];
    });
  }
}
