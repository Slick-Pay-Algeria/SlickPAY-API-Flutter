import 'app_config.dart';

class API {
  static String get baseUrl => SlickPAYAppConfig.baseURL;

  static const String accounts = "/users/accounts";

  static const String contacts = "/users/contacts";

  static const String transfers = "/users/transfers";

  static const String aggregations = "/users/aggregations";

  static const String invoices = "/users/invoices";
}
