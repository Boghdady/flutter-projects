import 'package:flutter/material.dart';
import 'package:orany_app/src/helpers/screen_arguments/reset_password_args.dart';
import 'package:orany_app/src/helpers/screen_arguments/verification_code_args.dart';
import 'package:orany_app/src/views/screens/bottom_bar_screens/bottom_nav_bar_container.dart';
import 'package:orany_app/src/views/screens/authentication/forget_password.dart';
import 'package:orany_app/src/views/screens/authentication/login.dart';
import 'package:orany_app/src/views/screens/authentication/registration.dart';
import 'package:orany_app/src/views/screens/authentication/reset_password.dart';
import 'package:orany_app/src/views/screens/authentication/verify_reset_password_code.dart';
import 'package:orany_app/src/views/screens/user_profile_details.dart';
import 'package:orany_app/src/views/screens/welcome.dart';
import 'package:orany_app/src/views/shared/undefined_view.dart';
import './constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => Welcome());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case registrationRoute:
        return MaterialPageRoute(builder: (_) => Registration());
      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());
      case verificationCodeRoute:
        VerifyResetPasswordArgs args = settings.arguments;

        return MaterialPageRoute(
            builder: (_) =>
                VerifyResetPasswordScreen(args.userId, args.userEmail));
      case bottomNavBarContainerRoute:
        return MaterialPageRoute(builder: (_) => BottomNavBarContainer());
      case resetPasswordRoute:
        ResetPasswordArgs args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => ResetPasswordScreen(args.userId));
      case userProfileDetailsRoute:
        return MaterialPageRoute(builder: (_) => UserProfileDetails());
      default:
        return MaterialPageRoute(
          builder: (context) => UndefinedView(
            name: settings.name,
          ),
        );
    }
  }
}
