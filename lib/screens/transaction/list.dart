import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/transaction.dart';
import 'package:flutter_state_management/models/transactions.dart';
import 'package:flutter_state_management/screens/transaction/form.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Transferências';

class TransactionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: Consumer<Transactions>(builder: (context, transactions, child) {
        return ListView.builder(
          itemCount: transactions.transactions.length,
          itemBuilder: (context, i) {
            final transaction = transactions.transactions[i];
            return TransactionItem(transaction);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransactionForm();
            }),
          );
        },
      ),
    );
  }

}

class TransactionItem extends StatelessWidget {
  final Transaction _transaction;

  TransactionItem(this._transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transaction.valueToString()),
        subtitle: Text(_transaction.accountNumberToString()),
      ),
    );
  }
}
