import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/registration/registeration_footer_widget.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/registration/registration_form_widget.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        leading: Container(),
        title: Text(getTranslated(context, "btn_sign_up")),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              RegistrationFromWidget(),
              UIHelper.verticalSpaceMedium,
//              RegistrationFooterWidget(),
              UIHelper.verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }
}
