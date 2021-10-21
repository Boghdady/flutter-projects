import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/dev-data/chat_data.dart';
import 'package:orany_app/src/views/shared/main_screens_app_bar.dart';
import 'package:orany_app/src/views/widgets/chat/chat_item.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: MainScreensAppBar(
        title: 'المحادثات',
        iconData: null,
      ),
      body: Container(
        child: ListView.separated(
          padding: EdgeInsets.all(10),
          separatorBuilder: (BuildContext context, int index) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 0.5,
                width: MediaQuery.of(context).size.width / 1.3,
                child: Divider(),
              ),
            );
          },
          itemCount: chats.length,
          itemBuilder: (BuildContext context, int index) {
            Map chat = chats[index];
            return ChatItem(
              dp: chat['dp'],
              name: chat['name'],
              isOnline: chat['isOnline'],
              counter: chat['counter'],
              msg: chat['msg'],
              time: chat['time'],
            );
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
