// ========== Navigation Routes ============= //
const String welcomePageRoute = '/';
const String loginPageRoute = '/login';
const String registrationPageRoute = '/registration';
const String forgotPageRoute = '/forgetPassword';
const String VerifyResetCodePageRoute = '/verificationCode';
const String resetPasswordPageRoute = '/resetPassword';
const String bottomNavigationRoute = '/BottomNavigation';
const String userDetailsPageRoute = '/userDetails';

// ========== URLs ============= //
const String base_url = 'http://127.0.0.1:8000/api/v1';

// ========== Authentication URLs ============= //
const String auth_login = base_url + '/users/login';
const String auth_signup = base_url + '/users/signup';
const String auth_forgot_password = base_url + '/users/forgotPassword';
const String auth_verify_password_reset_code =
    base_url + '/users/VerifyResetPasswordCode';
const String auth_reset_password = base_url + '/users/resetPassword';

// ========== User URLs ============= //
const String get_all_users = base_url + '/users';
