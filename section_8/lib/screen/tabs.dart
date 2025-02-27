import 'package:flutter/material.dart';
import 'package:section_8/main.dart';
import 'package:section_8/model/meal.dart';
import 'package:section_8/screen/categories.dart';
import 'package:section_8/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals = [];

  var currentIndex = 0;
  var currentAppTitle = "Categories";

  void _onToggleStar(Meal meal) {
    ScaffoldMessenger.of(context).clearSnackBars();

    if (favoriteMeals.contains(meal)) {
      setState(() {
        favoriteMeals.remove(meal);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Meal is no longer a favorite"),
        ),
      );
    } else {
      setState(() {
        favoriteMeals.add(meal);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Text("Marked as favorite"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen;

    if (currentIndex == 0) {
      currentScreen = Categories(
        onToggleStar: _onToggleStar,
      );
    } else {
      currentScreen = Meals(
        meals: favoriteMeals,
        onToggleStar: _onToggleStar,
      );
      currentAppTitle = "Favorites";
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currentAppTitle),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      body: currentScreen,
    );
  }
}
