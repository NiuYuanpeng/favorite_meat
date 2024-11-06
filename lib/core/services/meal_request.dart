import 'package:favorite_meat/core/model/meal_model.dart';

import 'http_request.dart';

class YPMealRequest {
  static Future<List<YPMealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2.json转modal
    final mealArray = result["meal"];
    List<YPMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(YPMealModel.fromJson(json));
    }
    return meals;
  }
}