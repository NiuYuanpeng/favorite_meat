
import 'package:favorite_meat/core/extension/int_extension.dart';
import 'package:favorite_meat/core/viewmodel/filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YPFilterContent extends StatelessWidget {
  const YPFilterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildChoiceTitle(context),
        buildListContent(),
      ],
    );
  }

  Widget buildChoiceTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text('展示你的选择', style: Theme.of(context).textTheme.displayMedium?.copyWith(
        fontWeight: FontWeight.bold
      ),),
    );
  }
  
  Widget buildListContent() {
    // 当Column里面包裹ListView的时候就会报错hasSize，前面我们通过shrinkWrap: true解决
    // 但是现在我们要的是除了上面的标题，剩下的都给ListView，所以我们包裹一个Expanded，让ListView给剩下的空间撑满
    return Expanded(
      child: Consumer<YPFilterViewModel>(
        builder: (ctx, filterVM, child) {
          bool isSelect = false;
          return ListView(
            children: [
              buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "素食主义", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subtitle, bool value, ValueChanged onChange) {
    return  ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: onChange),
    );
  }
}
