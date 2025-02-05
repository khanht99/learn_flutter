import 'package:flutter/material.dart';
import 'package:section_5/model/expense.dart';
import 'package:section_5/widget/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenseList, {super.key});

  final List<Expense> expenseList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (ctx, index) => ExpenseItem(expenseList[index]),
      ),
    );
  }
}
