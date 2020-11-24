import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/transactions.dart';
import 'package:flutter_state_management/screens/transaction/list.dart';
import 'package:provider/provider.dart';

final _title = ' Last transactions';

class LastTransactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        Consumer<Transactions>(
          builder: (context, transactions, child) {
            final _listSize = transactions.transactions.length;
            final _lastTransactions = transactions.transactions.reversed;
            return _listSize == 0
                ? NoTransactionsFound()
                : ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _listSize <= 2 ? _listSize : 2,
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return TransactionItem(_lastTransactions.elementAt(i));
                    },
                  );
          },
        ),
        RaisedButton(
          child: Text('Transactions'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TransactionList();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class NoTransactionsFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('You haven\'t done any transaction yet!'),
      ),
    );
  }
}
