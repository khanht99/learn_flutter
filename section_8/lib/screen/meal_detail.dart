import 'package:flutter/material.dart';
import 'package:section_8/model/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetail extends StatefulWidget {
  const MealDetail({super.key, required this.meal, required this.onToggleStar});

  final Meal meal;
  final void Function(Meal) onToggleStar;

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.title),
        actions: [
          IconButton(
            onPressed: () {
              widget.onToggleStar(widget.meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.meal.imageUrl,
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              for (final item in widget.meal.ingredients)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    item,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "Steps",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              for (final item in widget.meal.steps)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Text(
                    item,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
