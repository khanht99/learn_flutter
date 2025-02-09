import 'package:flutter/material.dart';
import 'package:section_5/model/expense.dart';
import 'package:section_5/widget/expense_item.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(this.expenseList, this.removeExpense, {super.key});

  final List<Expense> expenseList;
  final void Function(Expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenseList[index]),
          child: ExpenseItem(expenseList[index]),
          onDismissed: (direction) {
            if (expenseList.isNotEmpty) {
              print('index' + index.toString());
              print('expenseList: ' + expenseList.toString());
              removeExpense(expenseList[index]);
            }
          },
        ),
      ),
    );
  }
}
