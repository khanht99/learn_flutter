import 'package:flutter/material.dart';
import 'package:section_8/model/meal.dart';
import 'package:section_8/screen/meal_detail.dart';
import 'package:section_8/widget/meal_item.dart';

class Meals extends StatelessWidget {
  const Meals(
      {super.key, required this.meals, this.title});

  final List<Meal> meals;
  final String? title;

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return MealDetail(
            meal: meal,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals[index],
          onSelectMeal: _selectMeal,
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uh oh... nothing hear!",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            Text(
              "Try selecting a different category",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ],
        ),
      );
    }

    if (title != null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content,
      );
    } else {
      return content;
    }
  }
}
