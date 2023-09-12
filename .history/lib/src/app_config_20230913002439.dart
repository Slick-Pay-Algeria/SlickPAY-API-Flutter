class SlickPAYAppConfig {
  static String baseURL = "https://devapi.slick-pay.com/api/v2";
  static String publicKEY = "57|74wHgIsMKIGomdIEgyBW5bSZ5Gw3vFYcfjPTF3wL";

  static void set({
    required String BaseUrl,
    required String PublicKey,
  }) {
    baseURL = BaseUrl;
    publicKEY = PublicKey;
  }
}
