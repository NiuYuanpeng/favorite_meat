// class YPMealModel {
//   List<Meal>? meal;
//
//   YPMealModel({this.meal});
//
//   YPMealModel.fromJson(Map<String, dynamic> json) {
//     if (json['meal'] != null) {
//       meal = <Meal>[];
//       json['meal'].forEach((v) {
//         meal!.add(new Meal.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.meal != null) {
//       data['meal'] = this.meal!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// 复杂度
List<String> complexes = ["简单", "中等", "困难"];

class YPMealModel {
  String? id;
  List<String>? categories;
  String? title;
  int? affordability;
  int? complexity;
  String? complexStr;//复杂度
  String? imageUrl;
  int? duration;
  List<String>? ingredients;
  List<String>? steps;
  bool? isGlutenFree;
  bool? isVegan;
  bool? isVegetarian;
  bool? isLactoseFree;
  // 是否收藏
  bool _isFavor = false;


  bool get isFavor => _isFavor;

  set isFavor(bool value) {
    _isFavor = value;
  }

  YPMealModel(
      {this.id,
        this.categories,
        this.title,
        this.affordability,
        this.complexity,
        this.imageUrl,
        this.duration,
        this.ingredients,
        this.steps,
        this.isGlutenFree,
        this.isVegan,
        this.isVegetarian,
        this.isLactoseFree});

  YPMealModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categories = json['categories'].cast<String>();
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    // 自己复制
    complexStr = complexes[json['complexity']];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = json['ingredients'].cast<String>();
    steps = json['steps'].cast<String>();
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categories'] = this.categories;
    data['title'] = this.title;
    data['affordability'] = this.affordability;
    data['complexity'] = this.complexity;
    data['imageUrl'] = this.imageUrl;
    data['duration'] = this.duration;
    data['ingredients'] = this.ingredients;
    data['steps'] = this.steps;
    data['isGlutenFree'] = this.isGlutenFree;
    data['isVegan'] = this.isVegan;
    data['isVegetarian'] = this.isVegetarian;
    data['isLactoseFree'] = this.isLactoseFree;
    return data;
  }
}
