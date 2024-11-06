
import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:favorite_meat/ui/pages/filter/filter.dart';
import 'package:flutter/material.dart';

class YPHomeDrawer extends StatelessWidget {
  const YPHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250.px,
        child: Drawer(
          child: Column(
            children: [
              // 1.开始动手
              buildHeadView(context),
              // 2.进餐和过滤
              buildDrawListTtile(context, Icon(Icons.restaurant,), '进餐', () {
                Navigator.of(context).pop();
              }),
              buildDrawListTtile(context, Icon(Icons.settings, ), '过滤', () {
                Navigator.of(context).pushNamed(YPFilterPage.routeName);
              }),
    ],
          ),
        )
    );
  }

  Widget buildHeadView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      margin: EdgeInsets.only(bottom: 20.px),
      alignment: Alignment(0,0.6),
      color: Colors.orange,
      child: Text('开始动手', style: Theme.of(context).textTheme.displayLarge?.copyWith(
        fontWeight: FontWeight.bold
      ),),
    );
  }

  Widget buildDrawListTtile(BuildContext context, Widget icon, String title, GestureTapCallback handler) {

    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.displayMedium,),
      leading: icon,
      onTap: handler,
    );
  }
}
