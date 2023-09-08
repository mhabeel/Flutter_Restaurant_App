import 'package:flutter/material.dart';
import 'package:screens_application/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({Key key}) : super(key: key);
  static const routeName = '/FilterScreen';
  final bool isGlutinFree;
  final bool isLectoseFree;
  final bool isVegiterian;
  final bool isVegan;
  final Function filter;
  FilterScreen(this.isGlutinFree, this.isLectoseFree, this.isVegiterian,
      this.isVegan, this.filter);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutinFree;
  var lectoseFree;
  var vegiterian;
  var vegan;

  @override
  void initState() {
    glutinFree = widget.isGlutinFree;
    lectoseFree = widget.isLectoseFree;
    vegiterian = widget.isVegiterian;
    vegan = widget.isVegan;

    super.initState();
  }

  Widget buildSwitchList(
      String title, String subtitle, bool value, Function newValue) {
    return SwitchListTile(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: newValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(title: Text('My Filter')),
        body: Column(
          children: [
            Container(
              // height: 80,
              width: double.infinity,
              color: Color.fromARGB(255, 151, 116, 156),
              padding: EdgeInsets.only(left: 100, top: 20, bottom: 20),
              child: Text(
                'Adjust Your Meals',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildSwitchList(
                      'Glutin free',
                      'This contains Glutin free Meals',
                      glutinFree, (newValue) {
                    setState(() {
                      glutinFree = newValue;
                      widget.filter(glutinFree, lectoseFree, vegiterian, vegan);
                    });
                  }),
                  buildSwitchList(
                      'Lictose free',
                      'This contains Lictose free Meals',
                      lectoseFree, (newValue) {
                    setState(() {
                      lectoseFree = newValue;
                      widget.filter(glutinFree, lectoseFree, vegiterian, vegan);
                    });

                    print(widget.filter);
                    print(widget.isLectoseFree);
                  }),
                  buildSwitchList('Vegiterian',
                      'This contains Vegiterian Meals', vegiterian, (newValue) {
                    setState(() {
                      vegiterian = newValue;
                      widget.filter(glutinFree, lectoseFree, vegiterian, vegan);
                    });
                  }),
                  buildSwitchList('Vegan', 'This contains Vegan Meals', vegan,
                      (newValue) {
                    setState(() {
                      vegan = newValue;
                      widget.filter(glutinFree, lectoseFree, vegiterian, vegan);
                    });
                  }),
                ],
              ),
            )
          ],
        ));
  }
}
