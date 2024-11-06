import 'package:flutter/material.dart';

class YPUnknownPage extends StatelessWidget {
  static const routeName = 'unknown';
  const YPUnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('错误页面'),
      ),
      body: Center(
        child: Text('暂未找到该页面！'),
      ),
    );
  }
}
