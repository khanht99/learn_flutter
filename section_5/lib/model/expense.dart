import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

final uuid = Uuid();
final formatter = DateFormat('yyyy-MM-dd');

final categoryIcon = {
  Category.food: Icons.cake,
  Category.travel: Icons.luggage,
  Category.work: Icons.work,
  Category.leisure: Icons.movie
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.icon})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final IconData icon;

  String getDateFormat() {
    return formatter.format(date);
  }
}
