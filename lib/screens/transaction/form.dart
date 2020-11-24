import 'package:flutter/material.dart';
import 'package:flutter_state_management/components/editor.dart';
import 'package:flutter_state_management/models/balance.dart';
import 'package:flutter_state_management/models/transaction.dart';
import 'package:flutter_state_management/models/transactions.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Criando Transferência';

const _labelValueField = 'Valor';
const _hintValueField = '0.00';

const _labelAccountNumberField = 'Número da conta';
const _hintAccountNumberField = '0000';

const _textConfirmButton = 'Confirmar';

class TransactionForm extends StatelessWidget {
  final TextEditingController _controllerAccountNumberField =
      TextEditingController();
  final TextEditingController _controllerValueField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerAccountNumberField,
              hint: _hintAccountNumberField,
              label: _labelAccountNumberField,
            ),
            Editor(
              hint: _hintValueField,
              controller: _controllerValueField,
              label: _labelValueField,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textConfirmButton),
              onPressed: () => _createTransaction(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    final int accountNumber = int.tryParse(_controllerAccountNumberField.text);
    final double value = double.tryParse(_controllerValueField.text);
    final isValid = _validateTransaction(context, accountNumber, value);
    if (isValid) {
      final newTransaction = Transaction(value, accountNumber);
      _refreshState(context, newTransaction, value);
      Navigator.pop(context);
    }
  }

  _validateTransaction(context, accountNumber, value) {
    final _hasEnoughBalance = value <=
        Provider.of<Balance>(
          context,
          listen: false,
        ).value;
    return accountNumber != null && value != null && _hasEnoughBalance;
  }

  _refreshState(context, newTransaction, value) {
    Provider.of<Transactions>(context, listen: false).add(newTransaction);
    Provider.of<Balance>(context, listen: false).draw(value);
  }

}
