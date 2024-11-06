import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:flutter/material.dart';

class YPOpreationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;
  YPOpreationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.px,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        children: [
          _icon,
          SizedBox(width: 3.px,),
          Text(_title, style: TextStyle(color: textColor),)
        ],
      ),
    );
  }
}
