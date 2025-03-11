import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_8/data/meals.dart';
import 'package:section_8/providers/filter_provider.dart';

import '../screen/filter.dart';

final mealsProvider = Provider((ref) {
  final filterActive = ref.watch(filtersProvider);
  
  return dummyMeals.where((meal) {
      if(filterActive[FilterCategory.isGlutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if(filterActive[FilterCategory.isLactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if(filterActive[FilterCategory.isVegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if(filterActive[FilterCategory.isVegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});