import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/user/get_all_users_bloc.dart';
import 'package:orany_app/src/core/api/user_service.dart';
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ScrollController _controller;
  final _getAllUsersBloc = GetAllUsersBloc();
  int page = 1;
  bool _moreUsersAvailable = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _moreUsersAvailable = true;
    });
    _getAllUsersBloc.fetchUsers(page);
    _controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _getAllUsersBloc.dispose();
  }

  void _scrollListener() async {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      page++;
      bool check = await _getAllUsersBloc.fetchUsers(page);
      if (check == true) {
        setState(() {
          _moreUsersAvailable = true;
        });
      } else {
        setState(() {
          _moreUsersAvailable = false;
        });
      }
      print('page:$page');
      print('_moreUsersAvailable:$_moreUsersAvailable');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Infinite Scroll",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _buildListView(),
    );
  }

  Widget _buildListView() {
    return StreamBuilder<List<User>>(
        stream: _getAllUsersBloc.usersStream,
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            return RefreshIndicator(
              child: ListView.separated(
                controller: _controller,
                itemCount: snapshot.data.length + 1,
                itemBuilder: (context, index) {
                  return index >= snapshot.data.length
                      ? showShimmer(_moreUsersAvailable,
                          context) // the reason why snapshot.data.length + 1
                      : ListTile(
                          title: Text(snapshot.data[index].name),
                          subtitle: Text(snapshot.data[index].email),
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
              ),
              onRefresh: () async {
                await _getAllUsersBloc.clearUsersList();
                page = 1;
                _moreUsersAvailable = true;
                await _getAllUsersBloc.fetchUsers(page);
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
              ),
            );
          }
        });
  }
}

showShimmer(bool moreUsersAvailable, BuildContext context) {
  return moreUsersAvailable == false
      ? Container(
          alignment: Alignment.center,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: Text('No more data'),
            ),
          ),
        )
      : Column(
          children: <Widget>[
            ListTile(
              title: buildContainer(),
              subtitle: buildContainer(),
            ),
            Divider(
              height: 8.0,
            ),
          ],
        );
}

Widget buildContainer() {
  return Container(
    color: Colors.grey.shade200,
    height: 24.0,
    width: 150.0,
    margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
  );
}
