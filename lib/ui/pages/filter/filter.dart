
import 'package:flutter/material.dart';

import 'filter_content.dart';

class YPFilterPage extends StatelessWidget {
  static const  routeName = '/filter';

  const YPFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('过滤条件'),
      ),
      body: YPFilterContent(),
    );
  }
}
