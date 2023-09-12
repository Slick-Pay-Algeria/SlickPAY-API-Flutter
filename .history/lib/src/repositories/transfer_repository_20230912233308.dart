import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api.dart';
import '../models/_models.dart';
import '../network.dart';

class TransferRepository {
  TransferRepository._();
  static final TransferRepository instance = TransferRepository._();

  Future<http.Response> calculateTransferCommission(
      {required double amount}) async {
    try {
      final response = await ApiClient.instance.post(
          "${API.transfers}/commission",
          jsonEncode({
            "amount": amount,
          }));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to   calculate Transfer Commission');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createTransfer({
    required double amount,
    String contact = '',
    String account = '',
    required String url,
  }) async {
    try {
      final response = await ApiClient.instance.post(
          API.transfers,
          jsonEncode({
            "amount": amount,
            "contact": contact,
            "account": account,
            "url": url,
          }));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 422) {
        throw Exception('Failed to create Transfer ${response.body}');
      } else {
        throw Exception('Failed to create Transfer');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> getTransferById({required int? id}) async {
    final response = await ApiClient.instance.get(
      "${API.transfers}/$id",
    );

    try {
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to get Transfer Details');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Transfer>> getTransfers({int offset = 20, int page = 1}) async {
    try {
      final response = await ApiClient.instance
          .get("${API.accounts}/?offset=$offset&page=$page");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        List<Transfer> result = <Transfer>[];
        for (var element in responseData['data']) {
          result.add(Transfer.fromJson(element));
        }
        return result;
      } else {
        throw Exception('"Error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> updateTransfer({
    required int id,
    required double amount,
    required String contact,
    required String url,
  }) async {
    try {
      final response = await ApiClient.instance.put(
        "${API.transfers}/$id",
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
        throw Exception('Failed to update Transfer ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteTransfer({required int id}) async {
    try {
      final response = await ApiClient.instance.get("${API.transfers}/$id");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete Transfer');
      }
    } catch (e) {
      rethrow;
    }
  }
}
