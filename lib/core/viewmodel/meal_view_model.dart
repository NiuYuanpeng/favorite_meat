import 'package:favorite_meat/core/services/json_parse.dart';
import 'package:favorite_meat/core/services/meal_request.dart';
import 'package:favorite_meat/core/viewmodel/base_view_model.dart';
import 'package:favorite_meat/core/viewmodel/filter_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:favorite_meat/core/model/meal_model.dart';


class YPMealViewModel extends BaseMealViewModel {

  YPMealViewModel() {
    //: TODO 打印请求次数
    // print('YPMealViewModel--请求次数');
    YPJsonParse.getMealData().then((rsp) {
      meals = rsp;
      // notifyListeners();
    });
  }

// YPMealViewModel() {
//   YPMealRequest.getMealData().then((rsp) {
//     _meals = rsp;
//     notifyListeners();
//   });
// }

}