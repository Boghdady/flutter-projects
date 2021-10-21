import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/views/screens/welcome.dart';

class MainScreensAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final IconData iconData;

  MainScreensAppBar({this.title, this.iconData});

  @override
  _MainScreensAppBarState createState() => _MainScreensAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MainScreensAppBarState extends State<MainScreensAppBar> {
  AuthenticationBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthenticationBloc();
  }

  @override
  void dispose() {
    _authBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return AppBar(
      elevation: 0.5,
      leading: Container(
        child: IconButton(
          icon: new Icon(
            widget.iconData,
            color: Colors.grey[600],
          ),
//          onPressed: () => Navigator.of(context).pop(null),
          onPressed: () {
            _authBloc.emitEvent(AuthenticationEventLogout());
            _redirectToPage(context, Welcome());
          },
        ),
      ),
      title: Container(
        alignment: Alignment.centerRight,
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
      centerTitle: true,
    );
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MaterialPageRoute newRoute =
          MaterialPageRoute(builder: (BuildContext context) => page);

      Navigator.of(context).pushAndRemoveUntil(
          newRoute, ModalRoute.withName('/BottomNavBarContainer'));
    });
  }
}
