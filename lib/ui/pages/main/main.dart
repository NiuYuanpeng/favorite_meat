import 'package:favorite_meat/ui/pages/home/home_drawer.dart';
import 'package:flutter/material.dart';

import 'initialize_item.dart';

class YPHomeMainPage extends StatefulWidget {
  static const routeName = '/';

  const YPHomeMainPage({super.key});

  @override
  State<YPHomeMainPage> createState() => _YPHomeMainPageState();
}

class _YPHomeMainPageState extends State<YPHomeMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: YPHomeDrawer(),
      body: IndexedStack(
        children: pages,
        index: _currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        // selectedItemColor: Colors.red,
        items: items,
        onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
        },
      ),

    );
  }
}
