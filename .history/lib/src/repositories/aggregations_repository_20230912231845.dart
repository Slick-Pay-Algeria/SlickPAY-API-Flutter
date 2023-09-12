import 'dart:convert';
import 'package:http/http.dart';
import '../api.dart';
import '../models/_models.dart';
import '../network.dart';

class AggregationRepository {
  AggregationRepository._();
  static final AggregationRepository instance = AggregationRepository._();

  Future<Response> calculateAggregationCommission(
      {required double total, required List<dynamic> contacts}) async {
    try {
      final response = await ApiClient.instance.post(
        "${API.aggregations}/commission",
        jsonEncode(
          {
            "type": "percentage",
            "total": total,
            "contacts": contacts,
          },
        ),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to calculate Aggregation Commission');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> createAggregation({
    required String url,
    required double total,
    required List<dynamic> contacts,
  }) async {
    try {
      final response = await ApiClient.instance.post(
          API.aggregations,
          jsonEncode({
            "url": url,
            "type": "percentage",
            "total": total,
            "contacts": contacts
          }));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
        
      } else {
        throw Exception('Failed to create aggregation');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Aggregation> getAggregationById({required int id}) async {
    try {
      final response = await ApiClient.instance.get(
        "${API.aggregations}/$id",
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return Aggregation.fromJson(responseData);
      } else {
        throw Exception('Failed to get Aggregation By Id');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Aggregation>> fetchAggregations({
    int offset = 20,
    int page = 1,
  }) async {
    try {
      final response = await ApiClient.instance.get(
        "${API.aggregations}/?offset=$offset&page=$page",
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        List<Aggregation> result = <Aggregation>[];
        for (var element in responseData['data']) {
          result.add(Aggregation.fromJson(element));
        }
        return result;
      } else {
        throw Exception('Failed to fetch Aggregations  ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> updateAggregation({
    required int id,
    required double total,
    required List<dynamic> contacts,
    required String url,
  }) async {
    try {
      final response = await ApiClient.instance.put(
        "${API.aggregations}/$id",
        jsonEncode({
          "url": url,
          "type": "percentage",
          "total": total,
          "contacts": contacts
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        return responseData;
      } else {
        throw Exception('Failed to update  aggregation ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteAggregation(String id) async {
    try {
      final response = await ApiClient.instance.get("${API.aggregations}/$id");
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to delete Aggregation');
      }
    } catch (e) {
      rethrow;
    }
  }
}
