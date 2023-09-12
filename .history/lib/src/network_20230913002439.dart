import 'package:http/http.dart' as http;
import 'api.dart';
import 'app_config.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient instance = ApiClient._();

  Map<String, String> getHeaders() {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer ${SlickPAYAppConfig.publicKEY}",
    };
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('${API.baseUrl}$endpoint');
    return await http.get(url, headers: getHeaders());
  }

  Future<http.Response> post(String endpoint, dynamic data) async {
    final url = Uri.parse('${API.baseUrl}$endpoint');
    return await http.post(url, body: data, headers: getHeaders());
  }

  Future<http.Response> put(String endpoint, dynamic data) async {
    final url = Uri.parse('${API.baseUrl}$endpoint');
    return await http.put(url, body: data, headers: getHeaders());
  }

  Future<http.Response> delete(String endpoint) async {
    final url = Uri.parse('${API.baseUrl}$endpoint');
    return await http.delete(url, headers: getHeaders());
  }

  // You can add more methods for other HTTP request types like PUT, DELETE, etc.
}
