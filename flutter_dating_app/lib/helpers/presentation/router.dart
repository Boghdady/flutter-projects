import 'package:flutter/material.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/forgot_password_page.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/login_page.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/registration_page.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/reset_password_page.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/verify_reset_code_page.dart';
import 'package:flutterdatingapp/features/authentication/presentation/pages/welcome_page.dart';
import 'package:flutterdatingapp/features/discover/presentation/pages/user_details_page.dart';
import 'package:flutterdatingapp/features/discover/presentation/widgets/discover/user_card_widget.dart';
import 'package:flutterdatingapp/helpers/presentation/constants.dart';
import 'package:flutterdatingapp/helpers/presentation/shared/bottom_navigation.dart';
import 'package:flutterdatingapp/helpers/presentation/undefined_view.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomePageRoute:
        return MaterialPageRoute(builder: (_) => WelcomePage());
      case loginPageRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case registrationPageRoute:
        return MaterialPageRoute(builder: (_) => RegistrationPage());
      case forgotPageRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case VerifyResetCodePageRoute:
        return MaterialPageRoute(builder: (_) => VerifyResetCodePage());
      case resetPasswordPageRoute:
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
      case bottomNavigationRoute:
        return MaterialPageRoute(builder: (_) => BottomNavigation());
      case userDetailsPageRoute:
        UserDetailsPageArguments args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UserDetailsPage(userId: args.id));
      default:
        return MaterialPageRoute(
          builder: (context) => UndefinedView(
            name: settings.name,
          ),
        );
    }
  }
}
