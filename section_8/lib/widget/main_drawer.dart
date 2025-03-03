import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onTap});

  final void Function(String type) onTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.fastfood_rounded,
                      size: 48,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cooking up!",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 26,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Meals",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground, fontSize: 26,),
            ),
            onTap: () {
              onTap("Meals");
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 26,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Filter",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground, fontSize: 26,),
            ),
            onTap: () {
              onTap("Filter");
            },
          ),
        ],
      ),
    );
  }
}
