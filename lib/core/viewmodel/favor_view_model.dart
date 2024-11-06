
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:favorite_meat/core/viewmodel/base_view_model.dart';
import 'package:flutter/material.dart';

import 'filter_view_model.dart';

class YPFavorViewModel extends BaseMealViewModel {

  void addMeal(YPMealModel meal) {
    originMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(YPMealModel meal) {
    originMeals.remove(meal);
    notifyListeners();
  }

  // 判断是否收藏
  bool isFavor(YPMealModel meal) {
    return originMeals.contains(meal);
  }

  void hanleMeal(YPMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}

/*
class YPFavorViewModel extends ChangeNotifier {

  // meals数组，对于HYMealViewModel就是所有的原始数据
  // 对于HYFavorViewModel就是收藏的原始数据
  List<YPMealModel> _favorMeals = [];

  late YPFilterViewModel _filterVM;
  // 因为HYMealViewModel和HYFavorViewModel都使用到了filter_view_model，所以我们搞一个base
  // 拿到filterVM
  void updateFilters(YPFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  // 将_meals根据标签过滤后的数据
  List<YPMealModel> get favorMeals {
    return _favorMeals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree!) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian!) return false;
      if (_filterVM.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
  }

  // //  获取原始数据
  // List<YPMealModel> get originMeals {
  //   return _favorMeals;
  // }

  //  设置原始数据
  set meals(List<YPMealModel> value) {
    _favorMeals = value;
    notifyListeners();
  }

  void addMeal(YPMealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(YPMealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  // 判断是否收藏
  bool isFavor(YPMealModel meal) {
    return _favorMeals.contains(meal);
  }

  void hanleMeal(YPMealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}
*/