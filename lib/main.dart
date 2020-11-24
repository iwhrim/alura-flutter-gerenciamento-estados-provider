import 'package:flutter/material.dart';
import 'package:flutter_state_management/models/balance.dart';
import 'package:flutter_state_management/screens/dashboard.dart';
import 'package:provider/provider.dart';

import 'screens/transaction/list.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (context) => Balance(0),
        child: BytebankApp(),
      )
    );

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
