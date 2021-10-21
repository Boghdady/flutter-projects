import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/views/bloc_widgets/bloc_state_builder.dart';
import 'package:orany_app/src/views/screens/bottom_bar_screens/bottom_nav_bar_container.dart';
import 'package:orany_app/src/views/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DecisionPage extends StatefulWidget {
  @override
  DecisionPageState createState() {
    return new DecisionPageState();
  }
}

class DecisionPageState extends State<DecisionPage> {
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
    return BlocEventStateBuilder<AuthenticationState>(
        bloc: _authBloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state.token == null || state.token == '') {
            _redirectToPage(context, Welcome());
          } else {
            print(state.token);
            _redirectToPage(context, BottomNavBarContainer());
          }

          // This page does not need to display anything since it will
          // always remain behind any active page (and thus 'hidden').
          return Container();
        });
  }

  void _redirectToPage(BuildContext context, Widget page) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MaterialPageRoute newRoute =
          MaterialPageRoute(builder: (BuildContext context) => page);

      Navigator.of(context)
          .pushAndRemoveUntil(newRoute, ModalRoute.withName('/decision'));
    });
  }
}
