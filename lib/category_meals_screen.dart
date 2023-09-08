import 'package:flutter/material.dart';
import './dummy_data.dart';
import './meal_item.dart';
import './model/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category_meals';
  final List<Meal> myMeals;
  CategoryMealsScreen(this.myMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // final String id;
  String routeArgsTitle;
  List<Meal> categoryMeals;
  var isItemRemoved = false;
  String routeArgsId;
  @override
  void didChangeDependencies() {
    if (!isItemRemoved) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      routeArgsTitle = routeArgs['title']; // title of category_item
      routeArgsId = routeArgs['id'];

      categoryMeals = widget.myMeals.where((e) {
        return e.categories.contains(routeArgsId);
      }).toList();

      super.didChangeDependencies();
      isItemRemoved = true;
    }
  }

  void removeItem(String mealId) {
    setState(() {});
    categoryMeals.removeWhere((e) => e.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(routeArgsTitle)),
        // body: ListView(
        //     children: categoryMeals.map((e) {
        //   return MealItem(
        //       affordability: e.affordability,
        //       complexity: e.complexity,
        //       duration: e.duration,
        //       imageUrl: e.imageUrl,
        //       title: e.title);
        // }).toList()),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              imageUrl: categoryMeals[index].imageUrl,
              title: categoryMeals[index].title,
              removeItem: removeItem,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
