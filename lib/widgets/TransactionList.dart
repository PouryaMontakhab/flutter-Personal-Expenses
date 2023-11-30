import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_app/widgets/transaction_item.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/image/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView(
              children: transactions
                  .map((item) => TransactionItem(
                      item, deleteTransaction, ValueKey(item.id)))
                  .toList(),
            ),
    );
  }
}
