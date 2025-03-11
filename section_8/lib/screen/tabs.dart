import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_8/screen/categories.dart';
import 'package:section_8/screen/filter.dart';
import 'package:section_8/screen/meals.dart';
import 'package:section_8/widget/main_drawer.dart';
import 'package:section_8/providers/meals_provider.dart';
import 'package:section_8/providers/favorites_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  var currentIndex = 0;
  var currentAppTitle = "Categories";
  var currentDrawerSelectedItem = "Meals";

  void _onDrawerItemTab(String type) async {
    Navigator.of(context).pop();
    if (type == "Filter") {
      await Navigator.of(context).push<Map<FilterCategory, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FilterScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentScreen;
    final meals = ref.watch(mealsProvider);

    if (currentIndex == 0) {
      currentScreen = Categories(
        filterMeals: meals,
      );
    } else {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      currentScreen = Meals(
        meals: favoriteMeals,
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
