import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:section_8/data/meals.dart';
import 'package:section_8/main.dart';
import 'package:section_8/model/meal.dart';
import 'package:section_8/screen/categories.dart';
import 'package:section_8/screen/filter.dart';
import 'package:section_8/screen/meals.dart';
import 'package:section_8/widget/main_drawer.dart';

const kInitialFilters = {
  FilterCategory.isGlutenFree: false,
  FilterCategory.isLactoseFree: false,
  FilterCategory.isVegetarian: false,
  FilterCategory.isVegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> favoriteMeals = [];
  List<Meal> filterMeals = dummyMeals;
  Map<FilterCategory, bool> selectedFilter = kInitialFilters;
  var currentIndex = 0;
  var currentAppTitle = "Categories";
  var currentDrawerSelectedItem = "Meals";

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

  void _onDrawerItemTab(String type) async {
    Navigator.of(context).pop();
    if (type == "Filter") {
      final result =
          await Navigator.of(context).push<Map<FilterCategory, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return Filter(filterValue: selectedFilter,);
          },
        ),
      );
      List<Meal> listMealFilter = [];
      result!.forEach((category, type) {
        if (category == FilterCategory.isGlutenFree) {
          listMealFilter = [
            ...listMealFilter,
            ...dummyMeals.where((meal) => meal.isGlutenFree && !listMealFilter.contains(meal))
          ];
        }
        if (category == FilterCategory.isLactoseFree) {
          listMealFilter = [
            ...listMealFilter,
            ...dummyMeals.where((meal) => meal.isLactoseFree && !listMealFilter.contains(meal))
          ];
        }
        if (category == FilterCategory.isVegetarian) {
          listMealFilter = [
            ...listMealFilter,
            ...dummyMeals.where((meal) => meal.isVegetarian && !listMealFilter.contains(meal))
          ];
        }
        if (category == FilterCategory.isVegan) {
          listMealFilter = [
            ...listMealFilter,
            ...dummyMeals.where((meal) => meal.isVegan && !listMealFilter.contains(meal))
          ];
        }
      });
      setState(() {
        selectedFilter = result;
        filterMeals = listMealFilter;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen;

    if (currentIndex == 0) {
      currentScreen = Categories(
        filterMeals: filterMeals,
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
      drawer: MainDrawer(
        onTap: _onDrawerItemTab,
      ),
      bottomNavigationBar: currentDrawerSelectedItem == "Meals"
          ? BottomNavigationBar(
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
                  currentDrawerSelectedItem = "Meals";
                  currentIndex = value;
                });
              },
              currentIndex: currentIndex,
              selectedItemColor:
                  Theme.of(context).colorScheme.onPrimaryContainer,
            )
          : null,
      body: currentScreen,
    );
  }
}
