import 'package:flutter/material.dart';
import 'package:flutter_news_app/screens/popup_menu_screens/about.dart';
import 'package:flutter_news_app/screens/popup_menu_screens/contact.dart';
import 'package:flutter_news_app/screens/popup_menu_screens/help.dart';
import 'package:flutter_news_app/screens/popup_menu_screens/settings.dart';

enum popMenuTitles {
  ABOUT,
  SETTINGS,
  HELP,
  CONTACT,
}

class PopupMenu extends StatefulWidget {
  @override
  _PopupMenuState createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<popMenuTitles>(
      itemBuilder: (context) {
        return <PopupMenuEntry<popMenuTitles>>[
          PopupMenuItem<popMenuTitles>(
            value: popMenuTitles.SETTINGS,
            child: Text("SETTINGS"),
          ),
          PopupMenuItem<popMenuTitles>(
            value: popMenuTitles.CONTACT,
            child: Text("CONTACT"),
          ),
          PopupMenuItem<popMenuTitles>(
            value: popMenuTitles.HELP,
            child: Text("HELP"),
          ),
          PopupMenuItem<popMenuTitles>(
            value: popMenuTitles.ABOUT,
            child: Text("ABOUT"),
          ),
        ];
      },
      onSelected: (popMenuTitles menu) {
        switch (menu) {
          case popMenuTitles.ABOUT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return About();
            }));
            break;
          case popMenuTitles.CONTACT:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Contact();
            }));
            break;
          case popMenuTitles.HELP:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Help();
            }));
            break;
          case popMenuTitles.SETTINGS:
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Settings();
            }));
            break;
        }
      },
      icon: Icon(Icons.more_vert),
    );
  }
}
