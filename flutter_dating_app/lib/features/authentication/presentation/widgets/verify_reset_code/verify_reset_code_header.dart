import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class HeaderTitleAndDescription extends StatelessWidget {
  final String userEmail;

  HeaderTitleAndDescription(this.userEmail);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          AutoSizeText(
            getTranslated(context, 'lbl_code_sent_to'),
            style: Theme.of(context).textTheme.headline1,
            overflow: TextOverflow.ellipsis,
          ),
          UIHelper.verticalSpaceSmall,
          Text(
            userEmail,
            style: Theme.of(context).textTheme.headline4,
          ),
          UIHelper.verticalSpaceMedium,
          Text(
            getTranslated(context, 'lbl_enter_verification_code'),
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
