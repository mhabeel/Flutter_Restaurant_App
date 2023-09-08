import 'package:flutter/material.dart';
import 'package:screens_application/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    Key key,
  }) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _tabs = [
    {'page': CategoryScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(), 'title': 'My Favorites'},
  ];

  int _selectedIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MainDrawer.isFavorite == true) {
      _selectedIndex = 1;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabs[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _tabs[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.red,
        currentIndex: _selectedIndex,
        onTap: _selectTab,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites')
        ],
      ),
    );

    // << ...Top Tabbar...>>
    // return DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(tabs: [
    //         Tab(
    //           icon: Icon(Icons.category),
    //           text: 'Categories',
    //         ),
    //         Tab(
    //           icon: Icon(Icons.favorite),
    //           text: 'Favorites',
    //         )
    //       ]),
    //     ),
    //     body: TabBarView(children: [CategoryScreen(), FavoritesScreen()]),
    //   ),
    // );
  }
}
