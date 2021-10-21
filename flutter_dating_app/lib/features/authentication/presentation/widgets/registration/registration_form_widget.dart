import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdatingapp/helpers/presentation/animation/fade_animation.dart';
import 'package:flutterdatingapp/helpers/presentation/localization/language_constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/loading_button.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/shared_text_field.dart';
import 'package:flutterdatingapp/helpers/presentation/ui_helpers.dart';

class RegistrationFromWidget extends StatefulWidget {
  @override
  _RegistrationFromWidgetState createState() => _RegistrationFromWidgetState();
}

class _RegistrationFromWidgetState extends State<RegistrationFromWidget> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _retypeController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypeController = TextEditingController();
    _retypeController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _retypeController?.dispose();
    super.dispose();
  }

  bool _isMan = false;
  bool _isWoman = false;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _buildMaleFemaleSelection(),
          UIHelper.verticalSpaceMedium,
          FadeAnimation(
              0.5,
              SharedTextField(
                controller: _nameController,
                textInputType: TextInputType.text,
                hintText: getTranslated(context, 'lbl_registration_name'),
                onChanged: (value) {},
                suffixIcon: Icons.person_pin,
                prefixIcon: null,
                obscureText: false,
              )),
          UIHelper.verticalSpaceSmall,
          FadeAnimation(
              0.6,
              SharedTextField(
                controller: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: getTranslated(context, 'txt_login_email'),
                onChanged: (value) {},
                suffixIcon: Icons.email,
                prefixIcon: null,
                obscureText: false,
              )),
          UIHelper.verticalSpaceSmall,
          FadeAnimation(
              0.7,
              SharedTextField(
                controller: _passwordController,
                textInputType: TextInputType.text,
                hintText: getTranslated(context, 'txt_login_password'),
                onChanged: (value) {},
                suffixIcon: Icons.security,
                prefixIcon: Icons.lock,
                obscureText: true,
              )),
          UIHelper.verticalSpaceSmall,
          FadeAnimation(
              0.8,
              SharedTextField(
                controller: _retypeController,
                textInputType: TextInputType.text,
                hintText: getTranslated(context, 'txt_retype_password'),
                onChanged: (value) {},
                suffixIcon: Icons.security,
                prefixIcon: Icons.lock,
                obscureText: true,
              )),
          UIHelper.verticalSpaceSmall,
          _buildBirthday(),
          UIHelper.verticalSpaceSmall,
          _buildLocation(),
          UIHelper.verticalSpaceSmall,
          _buildConditionAndRules(),
          UIHelper.verticalSpaceSmall,
          FadeAnimation(
              1.2,
              LoadingButton(
                  loading: _loading,
                  text:
                      getTranslated(context, 'lbl_registration_create_account'),
                  onPress: () {
                    setState(() => _loading = true);
                    Future.delayed(
                      Duration(seconds: 3),
                      () => setState(() => _loading = false),
                    );
                  })),
        ],
      ),
    );
  }

  Widget _buildConditionAndRules() {
    return Column(
      children: <Widget>[
        FadeAnimation(
            1.1,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  getTranslated(context, 'lbl_registration_continue'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                UIHelper.horizontalSpaceXSmall,
                InkWell(
                  onTap: () {},
                  child: AutoSizeText(
                    getTranslated(context, 'lbl_registration_terms'),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.teal,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
        FadeAnimation(
            1.6,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  getTranslated(context, 'lbl_registration_and'),
                  style: Theme.of(context).textTheme.headline5,
                ),
                UIHelper.horizontalSpaceXSmall,
                InkWell(
                  onTap: () {},
                  child: AutoSizeText(
                    getTranslated(context, 'lbl_registration_privacy'),
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.teal,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildMaleFemaleSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            if (_isWoman) {
              setState(() {
                _isWoman = false;
              });
            }
            setState(() {
              _isMan = !_isMan;
            });
          },
          child: FadeAnimation(
              0.3,
              Column(
                children: <Widget>[
                  Icon(
                    Icons.person_pin,
                    size: 40,
                    color: _isMan ? Colors.teal : Colors.grey.shade400,
                  ),
                  Text('Man',
                      style: TextStyle(
                        color: _isMan ? Colors.teal : Colors.grey.shade400,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              )),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
        ),
        InkWell(
          onTap: () {
            if (_isMan) {
              setState(() {
                _isMan = false;
              });
            }
            setState(() {
              _isWoman = !_isWoman;
            });
          },
          child: FadeAnimation(
              0.3,
              Column(
                children: <Widget>[
                  Icon(
                    Icons.pregnant_woman,
                    size: 40,
                    color: _isWoman ? Colors.teal : Colors.grey.shade400,
                  ),
                  Text(
                    'Woman',
                    style: TextStyle(
                      color: _isWoman ? Colors.teal : Colors.grey.shade400,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildBirthday() {
    return InkWell(
      onTap: () {
        // TODO: Open Datetimepicker
        print('test');
      },
      child: FadeAnimation(
          0.9,
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 12.0),
            height: 50,
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Choose your birthday",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          )),
    );
  }

  Widget _buildLocation() {
    return InkWell(
      onTap: () {
        print('test');
      },
      child: FadeAnimation(
          1,
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 12.0),
            height: 50,
            color: Colors.grey.shade200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Choose your location",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          )),
    );
  }
}
