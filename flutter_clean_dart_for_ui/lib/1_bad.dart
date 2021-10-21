import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final List<String> profileTags = [
    "Mobile Development",
    "Web Development",
    "Networking",
    "Linux Administration"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat, size: 25),
        onPressed: () {},
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 10),
          Center(
            child: CircleAvatar(
              child: Icon(Icons.person, size: 100),
              radius: MediaQuery.of(context).size.width / 4,
            ),
          ),
          SizedBox(height: 10),
          Text("JOHN DOM", style: Theme.of(context).textTheme.title),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting "
                "industry. Lorem Ipsum has been the industry's standard dummy.",
                style: Theme.of(context).textTheme.subtitle1),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Wrap(
              spacing: 4,
              children: _tagsToChips(profileTags).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Create Async Generator
  Iterable<Chip> _tagsToChips(List<String> tags) sync* {
    for (String tag in tags) {
      yield Chip(label: Text(tag));
    }
  }
}
