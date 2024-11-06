import 'dart:convert';
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:favorite_meat/core/model/category_model.dart';

class YPJsonParse {

  static Future<List<YPCategoryModel>> getCategoryData() async {

    // 1.加载Jason文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    final result = json.decode(jsonString);

    final resultList = result['category'];

    List<YPCategoryModel> categories = [];

    for (var category in resultList) {
      categories.add(YPCategoryModel.fromJson(category));
    }
    return categories;
  }

  static Future<List<YPMealModel>> getMealData() async {

    final jsonString = await rootBundle.loadString('assets/json/meal.json');

    final result = json.decode(jsonString);

    final resultList = result['meal'];

    List<YPMealModel> meals = [];

    for (var meal in resultList) {
      meals.add(YPMealModel.fromJson(meal));
    }

    return meals;
  }

}