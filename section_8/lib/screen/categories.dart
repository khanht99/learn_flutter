import 'package:flutter/material.dart';
import 'package:section_8/data/categories.dart';
import 'package:section_8/data/meals.dart';
import 'package:section_8/model/category.dart';
import 'package:section_8/model/meal.dart';
import 'package:section_8/screen/meals.dart';
import 'package:section_8/widget/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> meals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cxt) {
          return Meals(meals: meals, title: category.title);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick your category"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
        ),
        itemCount: availableCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryGridItem(
            category: availableCategories[index],
            onSelectItem: _selectCategory,
          );
        },
      ),
    );
  }
}
