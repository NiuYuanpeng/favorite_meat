
import 'package:favorite_meat/ui/pages/home/home_content.dart';
import 'package:favorite_meat/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

import 'home_app_bar.dart';

class YPHomePage extends StatelessWidget {
  static final routeName = 'home';

  const YPHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YPHomeAppBar(context),
      body: YPHomeContent(),
      // drawer: YPHomeDrawer(),
    );
  }
}
