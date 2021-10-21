import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/social_media_buttons.dart';
import 'package:orany_app/src/views/shared/social_media_description.dart';
import 'package:orany_app/src/views/widgets/login/login_form.dart';
import 'package:orany_app/src/views/widgets/login/new_user_text.dart';
import 'package:orany_app/src/views/widgets/login/title_and_subtitle.dart';

class LoginContainer extends StatelessWidget {
  final AuthenticationBloc _authBloc;
  LoginContainer(this._authBloc);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: 24.0,
          left: 24.0,
          right: 24.0,
          top: MediaQuery.of(context).size.height * 0.10,
        ),
        child: Column(
          children: <Widget>[
            TitleAndSubtitle(),
            UIHelper.verticalSpaceMedium,
            LoginForm(bloc: _authBloc),
            UIHelper.verticalSpaceMedium,
            SocialMediaDescription(),
            UIHelper.verticalSpaceMedium,
            SocialMediaButtons(),
            UIHelper.verticalSpaceMedium,
            NewUserText(),
          ],
        ),
      ),
    );
  }
}
