
import 'package:flutter/material.dart';

class YPFilterViewModel extends ChangeNotifier {
  // 无谷蛋白
  bool _isGlutenFree = false;
  // 严格素食主义
  bool _isVegan = false;
  // 素食主义
  bool _isVegetarian = false;
  // 有无乳糖
  bool _isLactoseFree = false;

  get isGlutenFree => _isGlutenFree;

  set isGlutenFree(value) {
    _isGlutenFree = value;
    notifyListeners();
  }

  get isLactoseFree => _isLactoseFree;

  set isLactoseFree(value) {
    _isLactoseFree = value;
    notifyListeners();
  }

  get isVegetarian => _isVegetarian;

  set isVegetarian(value) {
    _isVegetarian = value;
    notifyListeners();
  }

  get isVegan => _isVegan;

  set isVegan(value) {
    _isVegan = value;
    notifyListeners();
  }
}