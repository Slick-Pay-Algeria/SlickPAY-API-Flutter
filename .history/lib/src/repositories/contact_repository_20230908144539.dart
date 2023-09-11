import 'dart:convert';
import 'package:http/http.dart';

import '../api.dart';
import '../models/contact.dart';
import '../network.dart';

class ContactRepository {
  ContactRepository._();
  static final ContactRepository instance = ContactRepository._();

  Future<List<Contact>> fetchContacts({int offset = 20, int page = 1}) async {
    try {
      final response = await ApiClient.instance
          .get("${API.accounts}/?offset=$offset&page=$page");

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        List<Contact> result = <Contact>[];
        for (var element in responseData['data']) {
          result.add(Contact.fromJson(element));
        }
        return result;
      } else {
        throw Exception('"Error: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createContact({
    required String title,
    required String lastname,
    required String firstname,
    required String email,
    required String address,
    required String rib,
  }) async {
    final userData = Contact(
      title: title,
      lastName: lastname,
      firstName: firstname,
      email: email,
      address: address,
      rib: rib,
    );
    try {
      final response = await ApiClient.instance.post(
        API.contacts,
        json.encode(userData.toJson()),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('"Error: ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<Contact> getContact(String uuid) async {
    try {
      final response = await ApiClient.instance.get(
        "${API.contacts}/$uuid",
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return Contact.fromJson(responseData);
      } else {
        throw Exception('Failed to create user contact');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool> updateContact(String uuid) async {
    try {
      final response = await ApiClient.instance.get("${API.accounts}/$uuid");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to update user contact');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteContact(String uuid) async {
    try {
      final response = await ApiClient.instance.get("${API.contacts}$uuid");

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete user contact');
      }
    } catch (e) {
      rethrow;
    }
  }
}
