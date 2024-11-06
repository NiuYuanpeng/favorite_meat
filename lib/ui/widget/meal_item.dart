import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:favorite_meat/core/viewmodel/favor_view_model.dart';
import 'package:favorite_meat/ui/pages/detail/detail.dart';
import 'package:favorite_meat/ui/widget/operation_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/model/meal_model.dart';


// 多处使用，放到最外层的Widget
class YPMealItem extends StatelessWidget {

  final YPMealModel _mealModel;

  YPMealItem(this._mealModel);

  final cardRadius = 12.px;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,//阴影
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [
            buildBasicInfo(context),
            buildOperaInfo()
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(YPDetailPage.routeName, arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          // 只裁剪上面的两个角
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)
            ),
            child: Image.network(_mealModel.imageUrl!, 
              width: double.infinity, 
              height: 250.px, 
              fit: BoxFit.cover,
            )
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300.px,
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(6.px)
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 10.px,
              vertical: 5.px
            ),
            child: Text(_mealModel.title!, style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color:  Colors.white
            ),),
          ),
        )
        
            

      ],
    );
  }

  Widget buildOperaInfo() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          YPOpreationItem(Icon(Icons.schedule), '${_mealModel.duration}min'),
          YPOpreationItem(Icon(Icons.restaurant), '${_mealModel.complexStr}'),
          buildFavorItem(),
          // YPFavorWidget(mealModel: _mealModel)
        ],
      ),
    );
  }

  // 使用Provider 方案
  Widget buildFavorItem() {
    return  Consumer<YPFavorViewModel>(
      builder: (ctx, favorVM, child) {
        final favorIcon = favorVM.isFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
        final favorColor = favorVM.isFavor(_mealModel) ? Colors.red : Colors.black;

        final favor = favorVM.isFavor(_mealModel) ? '收藏' : '未收藏';
        return GestureDetector(
          child: YPOpreationItem(
            Icon(favorIcon, color: favorColor,),
            favor,
            textColor: favorColor,
          ),
          onTap: () {
            favorVM.hanleMeal(_mealModel);
          },
        );
      },
    );
  }
}

// 使用model属性方案
class YPFavorWidget extends StatefulWidget {
  const YPFavorWidget({
    super.key,
    required YPMealModel mealModel,
  }) : _mealModel = mealModel;

  final YPMealModel _mealModel;

  @override
  State<YPFavorWidget> createState() => _YPFavorWidgetState();
}

class _YPFavorWidgetState extends State<YPFavorWidget> {
  @override
  Widget build(BuildContext context) {
    final favorIcon = widget._mealModel.isFavor ? Icons.favorite : Icons.favorite_border;
    final favorColor = widget._mealModel.isFavor ? Colors.red : Colors.black;

    final favor = widget._mealModel.isFavor ? '收藏' : '未收藏';
    return GestureDetector(
      child: YPOpreationItem(
        Icon(favorIcon, color: favorColor,),
        favor,
        textColor: favorColor,
      ),
      onTap: () {
       setState(() {
         widget._mealModel.isFavor = !widget._mealModel.isFavor;
       });
      },
    );
  }
}

