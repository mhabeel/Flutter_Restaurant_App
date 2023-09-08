import 'package:flutter/material.dart';
import './dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routName = '/meal_detail_screen';
  const MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeMealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((e) => e.id == routeMealId);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl),
            SizedBox(
              height: 5,
            ),
            Text(
              meal.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text('Ingredients'),
            Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black12,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: meal.ingredients.map((e) {
                      final number = meal.ingredients.indexOf(e) + 1;
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text('$number'),
                        ),
                        title: Text(e),
                      );
                    }).toList(),
                  ),
                )),
            Text('Steps'),
            Container(
              height: 150,
              child: SingleChildScrollView(
                child: Column(
                  children: meal.steps.map((e) {
                    final number = meal.steps.indexOf(e) + 1;
                    return Column(
                      children: [
                        ListTile(
                          leading: Text('$number'),
                          title: Text(e),
                        ),
                        Divider(
                          color: Colors.black,
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            FloatingActionButton(
                child: Icon(Icons.delete),
                onPressed: () {
                  Navigator.of(context).pop(routeMealId);
                }),
          ],
        ),
      ),
    );
  }
}
