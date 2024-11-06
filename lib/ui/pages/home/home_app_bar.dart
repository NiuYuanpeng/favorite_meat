import 'package:flutter/material.dart';

class YPHomeAppBar extends AppBar {

  YPHomeAppBar(BuildContext context): super(
      title: Text('首页'),
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.insert_emoticon_sharp)
      ),
  );
}

/*
 Builder(
          builder: (ctx) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(ctx).openDrawer();
                },
                icon: Icon(Icons.insert_emoticon_sharp)
            );
          }
      )
      * */