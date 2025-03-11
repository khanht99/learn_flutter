import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_8/model/meal.dart';

class FavariteMealsNotifier extends StateNotifier<List<Meal>> {
  FavariteMealsNotifier() : super([]);

  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);

    if (mealIsFavorite) {
      state = state.where((item) => item.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavariteMealsNotifier, List<Meal>>((ref) {
  return FavariteMealsNotifier();
});
