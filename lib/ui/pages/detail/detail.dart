
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:favorite_meat/core/viewmodel/favor_view_model.dart';
import 'package:favorite_meat/ui/pages/detail/detail_content.dart';
import 'package:favorite_meat/ui/pages/detail/detail_floating.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YPDetailPage extends StatelessWidget {
  static const routeName = 'detail';

  const YPDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as YPMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title!),
      ),
      body: YPDetailContent(meal),
      floatingActionButton: YPFloatingActionButton(meal),
    );
  }
}
