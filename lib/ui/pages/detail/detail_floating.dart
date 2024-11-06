
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodel/favor_view_model.dart';

class YPFloatingActionButton extends StatelessWidget {

  final YPMealModel _mealModel;

  YPFloatingActionButton(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return Consumer<YPFavorViewModel>(
      builder: (ctx, favorVM, child) {
        final favorIcon = favorVM.isFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_mealModel) ? Colors.red : Colors.black;
        return FloatingActionButton(
          child: Icon(favorIcon, color: favorColor,),
          onPressed: () {
            favorVM.hanleMeal(_mealModel);
          },
        );
      },
    );
  }
}


// class YPFloatingActionButton extends StatefulWidget {
//   final YPMealModel _meal;
//
//   YPFloatingActionButton(this._meal);
//
//   @override
//   State<YPFloatingActionButton> createState() => _YPFloatingActionButtonState();
// }
//
// class _YPFloatingActionButtonState extends State<YPFloatingActionButton> {
//   @override
//   Widget build(BuildContext context) {
//     final favorIcon = widget._meal.isFavor ? Icons.favorite : Icons.favorite_border;
//     final favorColor = widget._meal.isFavor ? Colors.red : Colors.grey;
//     return  FloatingActionButton(
//         child: Icon(favorIcon, color: favorColor,),
//         onPressed: () {
//           setState(() {
//             widget._meal.isFavor = !widget._meal.isFavor;
//           });
//         });
//   }
// }
