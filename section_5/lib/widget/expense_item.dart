import 'package:flutter/material.dart';
import 'package:section_5/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenseItem, {super.key});

  final Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(expenseItem.title),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text("\$${expenseItem.amount}"),
                Spacer(),
                Row(
                  children: [
                    Icon(expenseItem.icon),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      expenseItem.getDateFormat(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
