import 'package:flutter/material.dart';
import 'package:flutter_state_management/components/balance.dart';
import 'package:flutter_state_management/models/balance.dart';
import 'package:flutter_state_management/screens/deposit/deposit.dart';
import 'package:flutter_state_management/screens/transaction/form.dart';
import 'package:flutter_state_management/screens/transaction/last_transactions.dart';
import 'package:flutter_state_management/screens/transaction/list.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bytebank'),
      ),
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text('Deposit'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DepositForm();
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text('Transfer'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TransactionForm();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          LastTransactions(),
        ],
      ),
    );
  }
}
