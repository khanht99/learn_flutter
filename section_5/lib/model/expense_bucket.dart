import 'package:section_5/model/expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenseList;

  ExpenseBucket({required this.category, required this.expenseList});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenseList = allExpenses
            .where((element) => element.category == category)
            .toList();

  double get sumExpense {
    double sum = 0;

    for (Expense item in expenseList) {
      sum += item.amount;
    }

    return sum;
  }
}
