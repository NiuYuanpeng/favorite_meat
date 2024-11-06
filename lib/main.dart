import 'package:favorite_meat/core/router/routes.dart';
import 'package:favorite_meat/core/viewmodel/favor_view_model.dart';
import 'package:favorite_meat/core/viewmodel/filter_view_model.dart';
import 'package:favorite_meat/core/viewmodel/meal_view_model.dart';
import 'package:favorite_meat/ui/shared/app_theme.dart';
import 'package:favorite_meat/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => YPFilterViewModel()),
        ChangeNotifierProxyProvider<YPFilterViewModel,YPMealViewModel>(
            create: (ctx) => YPMealViewModel(),
            update: (ctx, filterVM, mealVM) {
              mealVM?.updateFilters(filterVM);
              return mealVM!;
            }
        ),
        ChangeNotifierProxyProvider<YPFilterViewModel ,YPFavorViewModel>(
            create: (ctx) => YPFavorViewModel(),
            update: (ctx, filterVM, favorVM) {
              favorVM?.updateFilters(filterVM);
              return favorVM!;
            }),
        // ChangeNotifierProvider(create: (ctx) => YPFavorViewModel()),
      ],
       child: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    YPSizeFit.initialize(context);

    return MaterialApp(
      title: '我的美食',
      theme: YPAppTheme.norTheme,
      initialRoute: YPRouter.initalRoute,
      routes: YPRouter.routers,
      onGenerateRoute: YPRouter.generateRoute,
      onUnknownRoute: YPRouter.unKnownRoute,
    );
  }
}
