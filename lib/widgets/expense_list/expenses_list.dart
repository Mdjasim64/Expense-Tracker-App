import 'package:expenses_tracker_app/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;

  final void Function(Expense expense) onRemoveExpense;

  final itemMargin = const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenses[index]),
          background: Container(
            margin: itemMargin,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          onDismissed: (direction) =>
              onRemoveExpense(expenses[index]),
          child: ExpenseItem(expenses[index])),
    );
  }
}
