class AppUrl {
  static const liveBaseURL = "";
  static const localBaseURL = "https://49a5-105-112-36-177.ngrok.io/api/";


  static const baseURL = localBaseURL;
  get baseApi => Uri.parse(baseURL);
  get login => Uri.parse(baseURL + "login");
  get register => Uri.parse(baseURL + "signup");

  get forgotPassword => Uri.parse(baseURL + "forgot-password");

  get verifyEmail => Uri.parse(baseURL + "email/verify");
  get sendPasswordResetPin => Uri.parse(baseURL + "resend/email/token");
  get resetPasswordPin => Uri.parse(baseURL + "verify/password-pin");
  get setNewPassword => Uri.parse(baseURL + "reset-password");
}


