import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_8/screen/filter.dart';

class FilterNotifier extends StateNotifier<Map<FilterCategory, bool>> {
  FilterNotifier()
      : super({
          FilterCategory.isGlutenFree: false,
          FilterCategory.isLactoseFree: false,
          FilterCategory.isVegetarian: false,
          FilterCategory.isVegan: false,
        });

  void setFilters(Map<FilterCategory, bool> allFilters) {
    state = allFilters;
  }

  void setFilter(FilterCategory filter, bool isActive) {
    state = {
      ...state,
      filter: isActive,
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifier, Map<FilterCategory, bool>>(
        (ref) => FilterNotifier());
