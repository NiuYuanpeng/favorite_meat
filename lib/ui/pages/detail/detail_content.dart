
import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:favorite_meat/core/model/meal_model.dart';
import 'package:favorite_meat/ui/shared/size_fit.dart';
import 'package:flutter/material.dart';

class YPDetailContent extends StatelessWidget {
  final YPMealModel _meal;
  const YPDetailContent(this._meal);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildMakeTitle(context, '制作材料'),
          buildMakeMaterial(context),
          buildMakeTitle(context, '制作步骤'),
          buildMakeSteps(),
        ],
      ),
    );
  }
  // 1.横幅图片
  Widget buildBannerImage() {
    return Container(
        padding: EdgeInsets.all(8.px),
        // 用图片撑满，否则会出现不居中的情况
        width: double.infinity,
        child: Image.network(_meal.imageUrl?? "")
    );
  }
  // 2.制作材料
  Widget buildMakeMaterial(BuildContext context) {
    return buildMakeContentBg(
      child: ListView.builder(
          /**
           * 1.shrinkWrap
           * true->内容多大就占据多大的宽度，fales->尽可能占据高度
           * 2.column/listView嵌套listView，需要给被嵌套的listView一个指定高度
           * 不需要局部滚动，所以不设置height，而设置shrinkWrap
           * */
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          // 禁止滚动
          physics: NeverScrollableScrollPhysics(),
          itemCount: _meal.ingredients?.length,
          itemBuilder: (ctx, index) {
            return Card(
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.px, horizontal: 10.px),
                child: Text(_meal.ingredients![index]),
              ),
            );
          }),
    );
  }

  // 3.制作步骤
  Widget buildMakeSteps() {
    return buildMakeContentBg(
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _meal.steps!.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(child: Text('#${index+1}')),
              title: Text(_meal.steps![index]),
            );
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
        ),
    );
  }

  Widget buildMakeTitle(BuildContext context,String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px),
      child: Text(title, style: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.bold
      ),),
    );
  }

  // 抽取制作材料和制作步骤的背景
  Widget buildMakeContentBg({required Widget child}) {
    return Container(
      width: YPSizeFit.screenWidth-30.px,
      padding: EdgeInsets.all(8.px),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.px),
          border: Border.all(color: Colors.grey)
      ),
      child: child,
    );
  }
}
