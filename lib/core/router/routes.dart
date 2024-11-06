import 'package:favorite_meat/ui/pages/detail/detail.dart';
import 'package:favorite_meat/ui/pages/favor/favor.dart';
import 'package:favorite_meat/ui/pages/filter/filter.dart';
import 'package:favorite_meat/ui/pages/main/main.dart';
import 'package:favorite_meat/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:favorite_meat/ui/pages/home/home.dart';

import '../../ui/pages/onkonwn/onknown.dart';

class YPRouter {
  // main 路由
  static final String initalRoute = YPHomeMainPage.routeName;

  static final Map<String, WidgetBuilder> routers = {
    YPHomeMainPage.routeName: (ctx) => YPHomeMainPage(),
    YPFavorPage.routeName: (ctx) => YPFavorPage(),
    YPHomePage.routeName: (ctx) => YPHomePage(),
    YPMealPage.routeName: (ctx) => YPMealPage(),
    YPDetailPage.routeName: (ctx) => YPDetailPage(),
    // YPFilterPage.routeName: (ctx) => YPFilterPage()
  };
  // 路由钩子
  static final RouteFactory generateRoute = (setting) {
    if (setting.name == YPFilterPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return YPFilterPage();
          },
          fullscreenDialog: true
      );
    }
    return null;
  };

  static final RouteFactory unKnownRoute = (setting) {
    return MaterialPageRoute(builder: (ctx) {
      return YPUnknownPage();
    });
  };

}