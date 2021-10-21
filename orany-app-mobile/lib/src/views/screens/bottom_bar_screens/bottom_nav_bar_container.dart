import 'package:flutter/material.dart';
import 'package:orany_app/src/views/screens/bottom_bar_screens/more.dart';
import 'package:orany_app/src/views/screens/bottom_bar_screens/profile.dart';
import 'package:orany_app/src/views/shared/bottom_app_bar.dart';
import '../../shared/shared_app_bar.dart';
import 'chat.dart';
import 'search.dart';

class BottomNavBarContainer extends StatefulWidget {
  @override
  _BottomNavBarContainerState createState() => _BottomNavBarContainerState();
}

class _BottomNavBarContainerState extends State<BottomNavBarContainer> {
  Widget _lastSelected2 = SearchScreen();
  String _title = 'الرئيسية';
  List<Widget> pages = [
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
    MoreScreen()
  ];
  List<String> titles = ['الرئيسية', 'المحادثات', 'البروفايل', 'المزيد'];

  void _selectedTab(int index) {
    setState(() {
      // _lastSelected = 'TAB: $index';
      _lastSelected2 = pages[index];
      _title = titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _lastSelected2,
      bottomNavigationBar: CustomBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.teal,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          BottomAppBarItem(iconData: Icons.search, text: 'بحث'),
          BottomAppBarItem(iconData: Icons.chat_bubble, text: 'المحادثات'),
          BottomAppBarItem(iconData: Icons.account_circle, text: 'البروفايل'),
          BottomAppBarItem(iconData: Icons.more_horiz, text: 'المزيد'),
        ],
      ),
    );
  }
}
