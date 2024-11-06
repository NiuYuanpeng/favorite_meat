import 'package:favorite_meat/core/services/json_parse.dart';
import 'package:favorite_meat/core/viewmodel/favor_view_model.dart';
import 'package:favorite_meat/core/viewmodel/meal_view_model.dart';
import 'package:favorite_meat/ui/widget/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// class YPFavorContent extends StatelessWidget {
//   const YPFavorContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<YPMealViewModel>(
//         builder: (ctx, mealVM, child) {
//           final favor1Meals = mealVM.meals;
//           for (var meal in favor1Meals) {
//             print('YPFavorContent${meal.title}-${meal.isFavor}');
//           }
//           final favorMeals = mealVM.meals.where((meal) => meal.isFavor).toList();
//           print(favorMeals);
//           return ListView.builder(
//               itemCount: favorMeals.length,
//               itemBuilder: (ctx, index) {
//                 return YPMealItem(favorMeals[index]);
//               });
//         }
//     );
//   }
// }

class YPFavorContent extends StatelessWidget {
  const YPFavorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<YPFavorViewModel>(
        builder: (ctx, favorVM, child) {
          if (favorVM.meals.length == 0) {
            return Center(
              child: Text('未收藏美食'),
            );
          }
          return ListView.builder(
              itemCount: favorVM.meals.length,
              itemBuilder: (ctx, index) {
                return YPMealItem(favorVM.meals[index]);
              });
        }
    );
  }
}


// class YPFavorContent extends StatelessWidget {
//   const YPFavorContent({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: YPJsonParse.getMealData(),
//         builder: (ctx, snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           if (!snapshot.hasError) return Center(child: Text('加载失败'),);
//
//           final favorMeals = snapshot.data!.where((meal) => meal.isFavor).toList();
//           return ListView.builder(
//               itemBuilder: (ctx, index) {
//                 return YPMealItem(favorMeals[index]);
//               });
//         }
//        );
//   }
// }