import 'dart:convert';

import "package:get/get.dart";

import '../models/fruit_model.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "https://www.fruityvice.com/api/fruit";
  }

  static ApiProvider get to => Get.find();

  /// Get some fruits from the API
  ///
  /// Fruits are filtered by the [max] and [nutritions] parameters.
  /// Returns a [List] of [Fruit] objects.
  /// If the API call fails, returns an empty [List].
  Future<List<Fruit>> getFruits(
      {int max = 100, String nutritions = "carbohydrates"}) async {
    final response = await get('/$nutritions?max=$max');
    if (response.statusCode == 200) {
      final data = const JsonDecoder().convert(response.body);
      return data.map<Fruit>((e) => Fruit.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
