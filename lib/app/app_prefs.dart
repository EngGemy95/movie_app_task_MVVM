import 'dart:convert';

import 'package:movies_app/data/response/response.dart';
import 'package:movies_app/domain/models/models.dart';
import 'package:movies_app/presentation/resource_data/strings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:movies_app/data/mapper/mapper.dart';

class AppPreference {
  final SharedPreferences _sharedPreferences;

  AppPreference(this._sharedPreferences);

  Future<void> setCachedMovies(
      String type, List<ItemsResponse> itemsResponse) async {
    if (type == AppStrings.popularType) {
      await _sharedPreferences.setString(
          type,
          json.encode(itemsResponse
              .map<Map<String, dynamic>>((item) => item.toJson())
              .toList()));
    } else if (type == AppStrings.topRatedType) {
      await _sharedPreferences.setString(
          type,
          json.encode(itemsResponse
              .map<Map<String, dynamic>>((item) => item.toJson())
              .toList()));
    }
  }

  List<ItemsModel>? getCachedMovies(String type) {
    if (type == AppStrings.popularType) {
      String? itemsResponse = _sharedPreferences.getString(type);

      return (json.decode(itemsResponse ?? '[]') as List<dynamic>)
          .map<ItemsModel>((item) => ItemsResponse.fromJson(item).toDomain())
          .toList();
    } else if (type == AppStrings.topRatedType) {
      String? itemsResponse = _sharedPreferences.getString(type);

      return (json.decode(itemsResponse ?? '[]') as List<dynamic>)
          .map<ItemsModel>((item) => ItemsResponse.fromJson(item).toDomain())
          .toList();
    }
  }
}
