import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:section_8/providers/filter_provider.dart';

enum FilterCategory {
  isGlutenFree, isLactoseFree, isVegetarian, isVegan
}
class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterValue = ref.watch(filtersProvider);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Filters"),
          ),
          body: Column(
            children: [
              SwitchListTile(
                title: Text("Gluten-free"),
                subtitle: Text("Only include gluten-free meals"),
                value: filterValue[FilterCategory.isGlutenFree]!,
                onChanged: (val) {
                  ref.read(filtersProvider.notifier).setFilter(FilterCategory.isGlutenFree, val);
                },
              ),
              SwitchListTile(
                title: Text("Lactose-free"),
                subtitle: Text("Only include lactose-free meals"),
                value: filterValue[FilterCategory.isLactoseFree]!,
                onChanged: (val) {
                  ref.read(filtersProvider.notifier).setFilter(FilterCategory.isLactoseFree, val);
                },
              ),
              SwitchListTile(
                title: Text("Vegetarian"),
                subtitle: Text("Only include vegetarian meals"),
                value: filterValue[FilterCategory.isVegetarian]!,
                onChanged: (val) {
                  ref.read(filtersProvider.notifier).setFilter(FilterCategory.isVegetarian, val);
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                subtitle: Text("Only include vegan meals"),
                value: filterValue[FilterCategory.isVegan]!,
                onChanged: (val) {
                  ref.read(filtersProvider.notifier).setFilter(FilterCategory.isVegan, val);
                },
              ),
            ],
          ),
        ),
      );
  }
}
