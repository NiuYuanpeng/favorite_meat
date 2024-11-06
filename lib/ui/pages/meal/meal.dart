import 'package:favorite_meat/core/model/category_model.dart';
import 'package:favorite_meat/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YPMealPage extends StatelessWidget {
  static final routeName = 'meal';

  const YPMealPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取参数
    final category = ModalRoute.of(context)?.settings.arguments as YPCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: Center(
        child: YPMealContent(),
      ),
    );
  }
}
