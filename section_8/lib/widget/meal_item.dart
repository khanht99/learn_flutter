import 'package:flutter/material.dart';
import 'package:section_8/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext, Meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: () {
          onSelectMeal(context, meal);
        },
        borderRadius: BorderRadius.circular(12),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: meal.imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity),
              Positioned(
                top: 150,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Color.fromARGB(180, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        meal.title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.timer_sharp, size: 16),
                          Text(
                            "${meal.duration} min",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.work, size: 16),
                          Text(
                            "${meal.complexity.name[0].toUpperCase()}${meal.complexity.name.substring(1)}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.attach_money, size: 16),
                          Text(
                            "${meal.affordability.name[0].toUpperCase()}${meal.affordability.name.substring(1)}",
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
