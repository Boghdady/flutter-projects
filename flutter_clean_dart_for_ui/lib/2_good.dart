import 'package:flutter/material.dart';
import 'package:flutter_clean_dart_for_ui/widgets/profile_tags.dart';
import 'package:flutter_clean_dart_for_ui/widgets/spacing_widgets.dart';

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
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          SpaceH10(),
          _buildProfilePicture(context),
          SpaceH10(),
          Text(
            "JOHN DOM",
            style: Theme.of(context).textTheme.title,
            overflow: TextOverflow.clip,
          ),
          SpaceH10(),
          Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting "
              "industry. Lorem Ipsum has been the industry's standard dummy.",
              style: Theme.of(context).textTheme.subtitle1),
          SpaceH10(),
          ProfileTags(profileTags: profileTags),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(BuildContext context) {
    final halfScreenRadius = MediaQuery.of(context).size.width / 4;
    return Center(
      child: CircleAvatar(
        child: Icon(Icons.person, size: 100),
        radius: halfScreenRadius,
      ),
    );
  }
}
