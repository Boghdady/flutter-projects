import 'package:flutter/material.dart';

class ProfileTags extends StatelessWidget {
  const ProfileTags({
    Key key,
    @required this.profileTags,
  }) : super(key: key);

  final List<String> profileTags;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 4,
        children: _tagsToChips(profileTags).toList(),
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
