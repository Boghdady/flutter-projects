import 'package:flutter/material.dart';
import 'package:flutterdatingapp/dev-data/users.dart';
import 'package:flutterdatingapp/features/discover/presentation/widgets/discover/user_card_widget.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

///
/// Prevents the use of the "back" button
///
Future<bool> _onWillPopScope() async {
  return false;
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(getTranslated(context, 'btn_nav_bar_item_discover')),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            )
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding:
              EdgeInsets.only(left: 8.0, top: 8.0, bottom: 16.0, right: 8.0),
          child: GridView.builder(
            itemCount: users.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return UserCardWidget(user: user);
            },
          ),
        ),
      ),
    );
  }
}
