import 'dart:convert';

import 'package:restaurant_app_bloc/datasource/model/api_result_model.dart';
import 'package:restaurant_app_bloc/datasource/model/meta_model.dart';
import 'package:restaurant_app_bloc/datasource/model/restaurant_list.dart';
import 'package:http/http.dart' as http;

class RestaurantListService {
  static Future<ApiResult<MetaModel, RestaurantListModel>>
      getRestaurantList() async {
    try {
      final response =
          await http.get(Uri.parse('https://restaurant-api.dicoding.dev/list'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final meta = MetaModel(
          error: data['error'],
          message: data['message'],
          count: data['count'],
        );
        final restaurantList =
            RestaurantListModel.fromJson(data['restaurants']);
        return ApiResult(meta: meta, data: restaurantList);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Failed to load data');
    }
  }
}
