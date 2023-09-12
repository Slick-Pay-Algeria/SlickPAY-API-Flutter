import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import '../models/invoice.dart';
import '../network.dart';

class InvoiceRepository {
  InvoiceRepository._();
  static final InvoiceRepository instance = InvoiceRepository._();

  Future<http.Response> calculateCommission({required double amount}) async {
    try {
      final response = await ApiClient.instance.post(
        API.transfers,
        jsonEncode({
          "amount": amount,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to calculate Commission');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> createInvoice({
    required double amount,
    String contact = '',
    String account = '',
    required String url,
    required List<dynamic> items,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        API.invoices,
        jsonEncode({
          "amount": amount,
          "contact": contact,
          "url": url,
          "items": items,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to create invoice ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Invoice> getInvoiceById({required int id}) async {
    try {
      final response = await ApiClient.instance.get("${API.invoices}/$id");
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return Invoice.fromJson(responseData);
      } else {
        throw Exception('Failed to getting invoice details  ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Invoice>> fetchInvoices({int offset = 20, int page = 1}) async {
    try {
      final response = await ApiClient.instance
          .get("${API.invoices}/?offset=$offset&page=$page");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        List<Invoice> result = <Invoice>[];
        for (var element in responseData['data']) {
          result.add(Invoice.fromJson(element));
        }
        return result;
      } else {
        throw Exception('Failed to fetch Invoices  ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteInvoice({required int id}) async {
    try {
      final response = await ApiClient.instance.get("${API.accounts}/$id");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete invoice');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateInvoice({
    required int id,
    required double amount,
    required String contact,
    required String url,
  }) async {
    try {
      final response = await ApiClient.instance.put(
        "${API.invoices}/$id",
        jsonEncode({
          "amount": amount,
          "contact": contact,
          "url": url,
        }),
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to update invoice ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
