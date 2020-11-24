import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/transaction.dart';
import 'package:flutter_state_management/screens/transaction/form.dart';

const _titleAppBar = 'Transferências';

class TransactionList extends StatefulWidget {
  final List<Transaction> _transactions = List();

  @override
  State<StatefulWidget> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transactions.length,
        itemBuilder: (context, i) {
          final transaction = widget._transactions[i];
          return TransactionItem(transaction);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return TransactionForm();
            }),
          ).then(
            (receivedTransaction) => _update(receivedTransaction),
          );
        },
      ),
    );
  }

  void _update(Transaction transaction) {
    if (transaction != null) {
      setState(() {
        widget._transactions.add(transaction);
      });
    }
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
        title: Text(_transaction.value.toString()),
        subtitle: Text(_transaction.accountNumber.toString()),
      ),
    );
  }
}
