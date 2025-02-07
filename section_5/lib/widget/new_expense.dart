import 'package:flutter/material.dart';
import 'package:section_5/model/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.leisure;

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void _handleSelectDate() {
    final now = DateTime.now();
    showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(now.year - 1, now.month, now.day),
            lastDate: now)
        .then((onValue) {
      if (onValue != null) {
        setState(() {
          selectedDate = onValue;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
              maxLength: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    decoration:
                        InputDecoration(labelText: "Amount", prefixText: '\$ '),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      selectedDate == null
                          ? 'No date selected'
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: _handleSelectDate,
                      icon: Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                DropdownButton(
                  value: selectedCategory,
                  items: [
                    ...Category.values.map((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item.name.toUpperCase(),
                        ),
                      );
                    })
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  child: Text("Add Expense"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
