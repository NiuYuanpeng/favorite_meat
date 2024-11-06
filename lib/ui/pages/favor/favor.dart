import 'package:flutter/material.dart';

import 'favor_content.dart';


class YPFavorPage extends StatelessWidget {

  static const routeName = '/favor';

  const YPFavorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的收藏'),
      ),
      body: YPFavorContent()
    );
  }
}
