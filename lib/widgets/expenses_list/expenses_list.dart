import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    this.onDismissed,
  });

  final List<Expense> expenses;
  final Function(Expense expense)? onDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onDismissed?.call(expenses[index]);
          },
          background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(.75),
              margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal)),
          child: ExpenseItem(
            expense: expenses[index],
          )),
    );
  }
}
