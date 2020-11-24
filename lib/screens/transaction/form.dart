import 'package:flutter/material.dart';
import 'package:flutter_state_management/components/editor.dart';
import 'package:flutter_state_management/models/transaction.dart';

const _titleAppBar = 'Criando Transferência';

const _labelValueField = 'Valor';
const _hintValueField = '0.00';

const _labelAccountNumberField = 'Número da conta';
const _hintAccountNumberField = '0000';

const _textConfirmButton = 'Confirmar';

class TransactionForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransactionFormState();
  }
}

class TransactionFormState extends State<TransactionForm> {
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
    if (accountNumber != null && value != null) {
      final createdTransaction = Transaction(value, accountNumber);
      Navigator.pop(context, createdTransaction);
    }
  }
}
