import 'package:flutter/material.dart';
import 'package:screens_application/filter_screen.dart';
import 'package:screens_application/meal_detail_screen.dart';
import './tabs_screen.dart';
import './category_meals_screen.dart';
import './model/meal.dart';
import './dummy_data.dart';
import './categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isGlutinFree = false;
  bool isLictoseFree = false;
  bool isVegitarian = false;
  bool isVegan = false;
  List<Meal> filteredMeals = DUMMY_MEALS;

  bool filter(bool glutin, bool lactose, bool vegitarian, bool vegan) {
    setState(() {
      filteredMeals = DUMMY_MEALS.where((e) {
        isGlutinFree = glutin;
        isLictoseFree = lactose;
        isVegitarian = vegitarian;
        isVegan = vegan;

        if (glutin & !e.isGlutenFree) {
          return false;
        }
        if (lactose & !e.isLactoseFree) {
          return false;
        }
        if (vegitarian & !e.isVegetarian) {
          return false;
        }
        if (vegan & !e.isVegan) {
          return false;
        } else {
          return true;
        }
      }).toList();
      print(filteredMeals);
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // filteredMeals = DUMMY_MEALS.where((e) {
    //   if (isGlutinFree & !e.isGlutenFree) {
    //     return false;
    //   }
    //   if (isLictoseFree & !e.isLactoseFree) {
    //     return false;
    //   }
    //   if (isVegitarian & !e.isVegetarian) {
    //     return false;
    //   }
    //   if (isVegan & !e.isVegan) {
    //     return false;
    //   } else {
    //     return true;
    //   }
    // }).toList();
    // print(filteredMeals);
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  color: Color.fromARGB(255, 54, 63, 244),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GemunuLibre'),),),
      // darkTheme: ThemeData.dark(),
      //home: CategoryScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(filteredMeals),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(
            isGlutinFree, isLictoseFree, isVegitarian, isVegan, filter),
      },
    );
  }
}
