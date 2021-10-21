import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/loading_button.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class FooterButtonAndText extends StatefulWidget {
  @override
  _FooterButtonAndTextState createState() => _FooterButtonAndTextState();
}

class _FooterButtonAndTextState extends State<FooterButtonAndText> {
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            width: MediaQuery.of(context).size.width,
            child: LoadingButton(
                loading: _loading,
                text: getTranslated(context, 'btn_continue'),
                onPress: () {
                  setState(() => _loading = true);
                  Future.delayed(
                    Duration(seconds: 3),
                    () => setState(() {
                      _loading = false;
//                      Navigator.pushNamed(context, resetPasswordPageRoute);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        resetPasswordPageRoute,
                        ModalRoute.withName(VerifyResetCodePageRoute),
                      );
                    }),
                  );
                }),
          ),
          UIHelper.verticalSpaceLarge,
          Row(
            children: <Widget>[
              AutoSizeText(
                getTranslated(context, 'lbl_code_not_sent'),
                style: Theme.of(context).textTheme.headline4,
              ),
              UIHelper.horizontalSpaceSmall,
              InkWell(
                onTap: () {},
                child: AutoSizeText(
                  getTranslated(context, 'lbl_send_again'),
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
