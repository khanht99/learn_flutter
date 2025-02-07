import 'package:flutter/material.dart';
import 'package:section_5/model/expense.dart';
import 'package:section_5/widget/expense_list.dart';
import 'package:section_5/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  List<Expense> expenseList = [
    Expense(
        title: "expense 1",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.food,
        icon: categoryIcon[Category.food]!),
    Expense(
        title: "expense 2",
        amount: 29.99,
        date: DateTime.now(),
        category: Category.leisure,
        icon: categoryIcon[Category.leisure]!),
    Expense(
        title: "expense 3",
        amount: 39.99,
        date: DateTime.now(),
        category: Category.work,
        icon: categoryIcon[Category.work]!),
  ];

  void addExpense() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return const NewExpense();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Expense Tracker",
          textAlign: TextAlign.start,
        ),
        backgroundColor: Color.fromARGB(255, 236, 153, 36),
        actions: [
          IconButton(
            onPressed: addExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: ExpenseList(expenseList),
      ),
    );
  }
}
