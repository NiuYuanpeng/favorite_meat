
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class YPNonScrollableListView extends ListView {
  YPNonScrollableListView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    // this.itemExtent,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    List<Widget> children = const <Widget>[],
  }) : super(
    key: key,
    scrollDirection: scrollDirection,
    reverse: reverse,
    controller: controller,
    primary: primary,
    physics: NeverScrollableScrollPhysics(), // 设置为不可滑动
    shrinkWrap: shrinkWrap,
    padding: padding,
    // itemExtent: itemExtent,
    addAutomaticKeepAlives: addAutomaticKeepAlives,
    addRepaintBoundaries: addRepaintBoundaries,
    children: children,
  );
}