import 'package:favorite_meat/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

import '../../../core/model/category_model.dart';

class YPHomeCategoryItem extends StatelessWidget {

  final YPCategoryModel _category;

  YPHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: _category.cColor,
          gradient: LinearGradient(colors: [
            _category.cColor!.withOpacity(0.5),
            _category.cColor!,
          ]),
          borderRadius: BorderRadius.circular(12),
        ),
        // color: Colors.red,
        child: Center(
          child: Text(_category.title??'',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      onTap: () {
        // 跳转并传递参数
        Navigator.of(context).pushNamed(YPMealPage.routeName, arguments: _category);
      },
    );
  }
}
