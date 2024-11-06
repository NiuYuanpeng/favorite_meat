import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:favorite_meat/core/model/category_model.dart';
import 'package:favorite_meat/core/services/json_parse.dart';
import 'package:flutter/material.dart';

import 'home_category_item.dart';

class YPHomeContent extends StatelessWidget {
  const YPHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YPCategoryModel>>(
        future: YPJsonParse.getCategoryData(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
          if (snapshot.error != null) return Center(child: Text('请求失败'),);
          final categorys = snapshot.data;
          return GridView.builder(
              padding: EdgeInsets.all(20.px),
              itemCount: categorys?.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.px,
                crossAxisSpacing: 20.px,
                childAspectRatio: 1.5
              ),
              itemBuilder: (ctx, index) {
                return YPHomeCategoryItem(categorys![index]);
              });
        });
  }
}

// class YPHomeContent extends StatefulWidget {
//   const YPHomeContent({super.key});
//
//   @override
//   State<YPHomeContent> createState() => _YPHomeContentState();
// }
//
// class _YPHomeContentState extends State<YPHomeContent> {
//
//   List<YPCategoryModel> _categorys = [];
//   @override
//   void initState() {
//     // 加载数据
//     YPJsonParse.getCategoryData().then((rsp) {
//       setState(() {
//         _categorys = rsp;
//       });
//     });
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return GridView.builder(
//       padding: EdgeInsets.all(20.px),
//       itemCount: _categorys.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 20.px,
//           mainAxisSpacing: 20.px,
//           childAspectRatio: 1.5
//
//         ),
//         itemBuilder: (ctx, index) {
//         final bgColor = _categorys[index].cColor;
//           return YPHomeCategoryItem(_categorys[index]);
//         });
//   }
// }

