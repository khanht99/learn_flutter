import 'package:flutter/material.dart';
import 'package:section_8/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectItem});

  final Category category;
  final void Function(BuildContext, Category) onSelectItem;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelectItem(context, category);
      },
      borderRadius: BorderRadius.all(Radius.circular(16)),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withValues(alpha: 0.55),
              category.color.withValues(alpha: 0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onTertiaryContainer,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
