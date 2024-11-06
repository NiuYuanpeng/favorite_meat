import 'dart:ui';

import 'package:flutter/cupertino.dart';

class YPSizeFit {
  // 1.基本信息
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double statusHeight;

  static late double rpx;
  static late double px;

  static void initialize(BuildContext context, {double standardSize = 750}) {
    // 1.手机的物理分辨率
    physicalWidth = View.of(context).physicalSize.width;
    physicalHeight = View.of(context).physicalSize.height;

    // 2.获取dpr
    dpr = View.of(context).devicePixelRatio;

    // 3.宽度和高度
    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    // 4.状态栏高度
    statusHeight = View.of(context).padding.top / dpr;

    // 5.计算rpx的大小
    rpx = screenWidth / standardSize;
    px = screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }
}