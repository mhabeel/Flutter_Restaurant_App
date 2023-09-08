import 'package:flutter/material.dart';
import 'package:screens_application/filter_screen.dart';
import './tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);
  static bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String text, IconData icon, Function linkFunction) {
      return ListTile(
        leading: Icon(icon, size: 26, color: Colors.red),
        title: Text(
          text,
          style: TextStyle(fontSize: 24, color: Theme.of(context).primaryColor),
        ),
        onTap: linkFunction,
      );
    }

    return Drawer(
      //backgroundColor: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Cook up',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GemunuLibre'),
              )),
          SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Favorites', Icons.favorite, () {
            isFavorite = true;
            Navigator.of(context).pushReplacementNamed('/');
            Future.delayed(Duration(milliseconds: 500), () {
              isFavorite = false;
            });
          }),
          buildListTile('Filter', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
