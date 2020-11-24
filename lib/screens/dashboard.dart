import 'package:flutter/material.dart';
import 'package:flutter_state_management/components/balance.dart';
import 'package:flutter_state_management/models/balance.dart';
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
          Consumer<Balance>(
            builder: (context, balance, child) {
              return RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  balance.add(3);

                },
              );
            }
          )
        ],
      ),
    );
  }
}
