import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/verify_reset_code/verify_reset_code_footer.dart';
import 'package:flutterdatingapp/features/authentication/presentation/widgets/verify_reset_code/verify_reset_code_header.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';

class VerifyResetCodePage extends StatefulWidget {
  @override
  _VerifyResetCodePageState createState() => _VerifyResetCodePageState();
}

class _VerifyResetCodePageState extends State<VerifyResetCodePage> {
  TextEditingController _pinController;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslated(context, 'lbl_retrieve_password'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              top: 34.0,
              right: 24.0,
              left: 24.0,
            ),
            child: Column(
              children: <Widget>[
                HeaderTitleAndDescription('boghdady107@gmail.com'),
                Container(
                  margin: EdgeInsets.only(top: 24.0),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: FLPinCodeTextField(
                      controller: _pinController,
                      boxWidth: 60,
                      boxHeight: 75,
                      pinLength: 4,
                      minSpace: 10,
                      autofocus: true,
                      textStyle: TextStyle(fontSize: 22),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                            width: 2.0,
                          ),
                        ),
                        focusedErrorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                            width: 2.0,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        print('change -- $text');
                      },
                      onSubmitted: (text) {
                        print('submit -- $text');
                      },
                      onEditingComplete: () {
                        print('editing complete');
                      },
                    ),
                  ),
                ),
                FooterButtonAndText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
