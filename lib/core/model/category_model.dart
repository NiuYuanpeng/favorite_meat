// class YPCategoryModel {
//   List<Category>? category;
//
//   YPCategoryModel({this.category});
//
//   YPCategoryModel.fromJson(Map<String, dynamic> json) {
//     if (json['category'] != null) {
//       category = <Category>[];
//       json['category'].forEach((v) {
//         category!.add(new Category.fromJson(v));
//       });
//     }
//   }
//
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.category != null) {
//       data['category'] = this.category!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

import 'dart:ui';

class YPCategoryModel {
  String? id;
  String? title;
  String? color;
  Color? cColor;

  YPCategoryModel({this.id, this.title, this.color});

  YPCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 1.将color转成十六进制的数字
    final colorInt = int.parse(color!, radix: 16);
    // 2.使用或运算符生成cColor
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
