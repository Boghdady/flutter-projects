import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/message.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var messages = const [];

  // load messages from json file
  Future loadMessagesList() async {
    String content = await rootBundle.loadString('data/message.json');
    List collection = json.decode(content);
    var data = collection[0];
    List<Message> messages = List<Message>();
    messages.add(data[0]);
    print(data);
    print(messages[0]);
    setState(() {
      //messages = collection;
    });
  }

  @override
  void initState() {
    loadMessagesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemCount: messages.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 8.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          var message = messages[index];
          return ListTile(
            title: Text(message["subject"]),
            subtitle: Text(
              message["body"],
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            leading: CircleAvatar(
              child: Text("AB"),
            ),
            isThreeLine: false,
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              print(index);
            },
          );
        },
      ),
    );
  }
}
