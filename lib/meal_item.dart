import 'package:flutter/material.dart';
import 'package:screens_application/meal_detail_screen.dart';
import './model/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final Complexity complexity;
  final Affordability affordability;
  final int duration;
  final Function removeItem;
  MealItem(
      {@required this.id,
      @required this.affordability,
      @required this.complexity,
      @required this.duration,
      @required this.imageUrl,
      @required this.title,
      this.removeItem});
  get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Simple:
        return 'simple';
        break;
      default:
        return 'unknown';
    }
  }

  get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'unknown';
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routName, arguments: id)
        .then((result) {
      removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   child: Image.network(imageUrl),
                //   decoration:
                //       BoxDecoration(borderRadius: BorderRadius.circular(15)),
                // ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 30,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 20,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
                // Container(
                //   padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
                //   child: Text(
                //     title,
                //     style: TextStyle(
                //       backgroundColor: Colors.black38,
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   ),
                // )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.schedule,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  //firstRow
                  Row(
                    children: [
                      Icon(
                        Icons.work,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  //secondRow
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                  //thirdRow
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
