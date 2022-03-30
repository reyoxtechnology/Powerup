class AppUrl {
  static const liveBaseURL = "";
  static const localBaseURL = "https://677f-105-112-161-197.ngrok.io/api/";


  static const baseURL = localBaseURL;
  get login => Uri.parse(baseURL + "login");
  get register => Uri.parse(baseURL + "signup");
  get forgotPassword => Uri.parse(baseURL + "forgot-password");
}
