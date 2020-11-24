import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/models/transaction.dart';

class Transactions extends ChangeNotifier {

  final List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  add(Transaction transaction ) {
    transactions.add(transaction);
    notifyListeners();
  }

}
