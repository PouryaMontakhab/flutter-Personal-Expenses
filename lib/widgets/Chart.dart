import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:second_app/models/transaction.dart';
import 'package:second_app/widgets/ChartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactions;
  const Chart(this.transactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < transactions.length; i++) {
        if (transactions[i].date.day == weekDay.day &&
            transactions[i].date.month == weekDay.month &&
            transactions[i].date.year == weekDay.year) {
          totalSum += transactions[i].amount; 
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get totalSpendingAmount {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + (item['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((item) {
            return Expanded(
              child: ChartBar(
                  item['day'] as String,
                  item['amount'] as double,
                  totalSpendingAmount == 0.0
                      ? 0.0
                      : (item['amount'] as double) / totalSpendingAmount),
            );
          }).toList(),
        ),
      ),
    );
  }
}
