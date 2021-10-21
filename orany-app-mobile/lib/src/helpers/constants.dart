// ========== Navigation Routes ============= //
const String welcomeRoute = '/';
const String loginRoute = '/login';
const String registrationRoute = '/registration';
const String forgetPasswordRoute = '/forgetPassword';
const String verificationCodeRoute = '/verificationCode';
const String resetPasswordRoute = '/resetPassword';
const String bottomNavBarContainerRoute = '/BottomNavBarContainer';
const String userProfileDetailsRoute = '/UserProfileDetails';

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
