import 'package:flutter/material.dart';

enum FilterCategory {
  isGlutenFree, isLactoseFree, isVegetarian, isVegan
}
class Filter extends StatefulWidget {
  const Filter({super.key, required this.filterValue});

  final Map<FilterCategory, bool> filterValue;

  @override
  State<Filter> createState() {
    return _FilterState();
  }
}

class _FilterState extends State<Filter> {
  bool isGlutenFree = false;
  bool isLactoseFree = false;
  bool isVegetarianMeals = false;
  bool isVeganMeals = false;

  @override
  void initState() {
    super.initState();
    isGlutenFree = widget.filterValue[FilterCategory.isGlutenFree]!;
    isLactoseFree = widget.filterValue[FilterCategory.isLactoseFree]!;
    isVegetarianMeals = widget.filterValue[FilterCategory.isVegetarian]!;
    isVeganMeals = widget.filterValue[FilterCategory.isVegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if(didPop) return;
        Navigator.of(context).pop({
          FilterCategory.isGlutenFree: isGlutenFree,
          FilterCategory.isLactoseFree: isLactoseFree,
          FilterCategory.isVegetarian: isVegetarianMeals,
          FilterCategory.isVegan: isVeganMeals
        });
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Filters"),
          ),
          body: Column(
            children: [
              SwitchListTile(
                title: Text("Gluten-free"),
                subtitle: Text("Only include gluten-free meals"),
                value: isGlutenFree,
                onChanged: (val) {
                  setState(() {
                    isGlutenFree = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Lactose-free"),
                subtitle: Text("Only include lactose-free meals"),
                value: isLactoseFree,
                onChanged: (val) {
                  setState(() {
                    isLactoseFree = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegetarian"),
                subtitle: Text("Only include vegetarian meals"),
                value: isVegetarianMeals,
                onChanged: (val) {
                  setState(() {
                    isVegetarianMeals = val;
                  });
                },
              ),
              SwitchListTile(
                title: Text("Vegan"),
                subtitle: Text("Only include vegan meals"),
                value: isVeganMeals,
                onChanged: (val) {
                  setState(() {
                    isVeganMeals = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
