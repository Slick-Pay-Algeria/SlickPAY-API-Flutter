import 'dart:convert';
import 'package:http/http.dart';

import '../api.dart';
import '../models/account.dart';
import '../network.dart';

class AccountRepository {
  AccountRepository._();
  static final AccountRepository instance = AccountRepository._();

  Future<List<Account>> fetchAccounts({int offset = 20, int page = 1}) async {
    try {
      final response = await ApiClient.instance
          .get("${API.accounts}/?offset=$offset&page=$page");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        List<Account> result = <Account>[];
        for (var element in responseData['data']) {
          result.add(Account.fromJson(element));
        }
        return result;
      } else {
        throw Exception('"Error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow; // Rethrow the exception to maintain the original stack trace.
    }
  }

  Future<bool> createAccount({
    required String rib,
    required String title,
    required String lastname,
    required String firstname,
    required String address,
  }) async {
    try {
      final response = await ApiClient.instance.post(
        API.accounts,
        jsonEncode({
          "rib": rib,
          "title": title,
          "lastname": lastname,
          "firstname": firstname,
          "address": address,
        }),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to create user account');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Account> getAccount({required String uuid}) async {
    try {
      final response = await ApiClient.instance.get("${API.accounts}$uuid");

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return Account.fromJson(responseData);
      } else {
        throw Exception('Failed to create user account');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateAccount(String uuid) async {
    try {
      final response = await ApiClient.instance.get("${API.accounts}/$uuid");

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update user account');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteAccount(String uuid) async {
    try {
      final response = await ApiClient.instance.get("${API.accounts}/$uuid");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete user account');
      }
    } catch (e) {
      rethrow;
    }
  }
}
