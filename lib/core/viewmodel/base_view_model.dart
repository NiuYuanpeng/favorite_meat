
import 'package:flutter/material.dart';
import '../model/meal_model.dart';
import '../services/json_parse.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {
  // meals数组，对于HYMealViewModel就是所有的原始数据
  // 对于HYFavorViewModel就是收藏的原始数据
  List<YPMealModel> _meals = [];

  late YPFilterViewModel _filterVM;
  // 因为HYMealViewModel和HYFavorViewModel都使用到了filter_view_model，所以我们搞一个base
  // 拿到filterVM
  void updateFilters(YPFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  // 将_meals根据标签过滤后的数据
  List<YPMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree!) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian!) return false;
      if (_filterVM.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
  }

  //  获取原始数据
  List<YPMealModel> get originMeals {
    return _meals;
  }

  //  设置原始数据
  set meals(List<YPMealModel> value) {
    _meals = value;
    notifyListeners();
  }
}