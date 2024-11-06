import 'package:favorite_meat/core/model/category_model.dart';
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:favorite_meat/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

import '../../widget/meal_item.dart';

class YPMealContent extends StatelessWidget {
  const YPMealContent({super.key});

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments as YPCategoryModel;

    return Consumer<YPMealViewModel>(
        builder: (BuildContext context, mealVM, Widget? child) {
          // final favor1Meals = mealVM.meals;
          // for (var meal in favor1Meals) {
          //   print('YPMealContent${meal.title}-${meal.isFavor}');
          // }
          final meals = mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList();
          return ListView.builder(
              itemBuilder: (ctx, index) {
                return YPMealItem(meals[index]);
              },
              itemCount: meals.length
          );
        }
    );

    return Selector<YPMealViewModel, List<YPMealModel>>(
      // 判断两个List里面包含的东西是否相等，如果不相等，才刷新
        shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
        builder: (ctx, meals, child) {
          return ListView.builder(itemCount: meals.length,itemBuilder: (ctx, index) {
            return YPMealItem(meals[index]);
          });
        }, selector: (ctx, mealVM) {
          return mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList();
        }
    );
  }
}


/*
return Consumer<YPMealViewModel>(
        builder: (BuildContext context, mealVM, Widget? child) {
          final meals = mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList();
          return ListView.builder(
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(meals[index].title??""),);
              },
              itemCount: meals.length
          );
        }
    );
 */