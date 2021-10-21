import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/shared_app_bar.dart';
import 'package:orany_app/src/views/shared/social_media_buttons.dart';
import 'package:orany_app/src/views/shared/social_media_description.dart';
import 'package:orany_app/src/views/widgets/registration/registration_form.dart';
import 'package:orany_app/src/views/widgets/registration/registration_have_acount.dart';
import 'package:orany_app/src/views/widgets/registration/registration_headline_text.dart';

class RegistrationContainer extends StatelessWidget {
  final AuthenticationBloc bloc;

  RegistrationContainer(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: 'انشاء حساب  جديد',
      ),
      body: Container(
        margin: EdgeInsets.only(top: 4, right: 24.0, left: 24.0, bottom: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              UIHelper.verticalSpaceSmall,
              RegistrationHeadlineText(),
              UIHelper.verticalSpaceSmall,
              RegistrationFrom(bloc: bloc),
              SocialMediaDescription(),
              UIHelper.verticalSpaceSmall,
              SocialMediaButtons(),
              UIHelper.verticalSpaceMedium,
              RegistrationHaveAcount(),
              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
