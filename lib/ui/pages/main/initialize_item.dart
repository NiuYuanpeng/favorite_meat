import 'package:favorite_meat/ui/pages/favor/favor.dart';
import 'package:favorite_meat/ui/pages/home/home.dart';
import 'package:flutter/material.dart';

final List<Widget> pages = [
  YPHomePage(),
  YPFavorPage()
];

final List<BottomNavigationBarItem> items = [
  const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: '首页'
  ),
  const BottomNavigationBarItem(
      icon: Icon(Icons.star),
      label: '收藏'
  ),
];