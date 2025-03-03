import 'package:flutter/material.dart';
import 'package:section_8/data/categories.dart';
import 'package:section_8/model/category.dart';
import 'package:section_8/model/meal.dart';
import 'package:section_8/screen/meals.dart';
import 'package:section_8/widget/category_grid_item.dart';

class Categories extends StatelessWidget {
  const Categories(
      {super.key, required this.onToggleStar, required this.filterMeals});

  final void Function(Meal) onToggleStar;
  final List<Meal> filterMeals;

  void _selectCategory(BuildContext context, Category category) {
    List<Meal> meals = filterMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (cxt) {
          return Meals(
            meals: meals,
            title: category.title,
            onToggleStar: onToggleStar,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
    );
  }
}
