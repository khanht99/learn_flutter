import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:section_5/model/expense.dart';
import 'package:section_5/widget/chart.dart';
import 'package:section_5/widget/expense_list.dart';
import 'package:section_5/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  List<Expense> expenseList = [];

  void _addExpense(Expense newExpense) {
    setState(() {
      expenseList.add(newExpense);
    });
  }

  void _handleShowModalAddNewExpense() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) {
          return NewExpense(addExpense: _addExpense);
        });
  }

  void _removeExpense(Expense dismissibleExpense) {
    final indexItem = expenseList.indexOf(dismissibleExpense);

    setState(() {
      expenseList.remove(dismissibleExpense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: const Text("Expense deleted!"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                expenseList.insert(indexItem, dismissibleExpense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Text('No expense found. Start adding some!');

    if (expenseList.isNotEmpty) {
      mainContent = LayoutBuilder(builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width > 600) {
          return Row(
            children: [
              Chart(expenses: expenseList),
              ExpenseList(expenseList, _removeExpense),
            ],
          );
        } else {
          return Column(
            children: [
              Chart(expenses: expenseList),
              ExpenseList(expenseList, _removeExpense),
            ],
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Expense Tracker",
          textAlign: TextAlign.start,
        ),
        actions: [
          IconButton(
            onPressed: _handleShowModalAddNewExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: mainContent,
        ),
      ),
    );
  }
}
