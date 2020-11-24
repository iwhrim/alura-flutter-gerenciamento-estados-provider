import 'package:flutter/material.dart';
import 'package:flutter_state_management/components/editor.dart';
import 'package:flutter_state_management/models/balance.dart';
import 'package:provider/provider.dart';

const _titleAppBar = 'Receive deposit';

const _hintValueField = '0.00';
const _labelValueField = 'Value';
const _controllerValueField = '0.00';
const _textConfirmButton = 'Confirm';

class DepositForm extends StatelessWidget {

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
              hint: _hintValueField,
              controller: _controllerValueField,
              label: _labelValueField,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textConfirmButton),
              onPressed: () => _createDeposit(context),
            ),
          ],
        ),
      ),
    );
  }

  void _createDeposit(BuildContext context) {
    final double value = double.tryParse(_controllerValueField.text);
    // if (accountNumber != null && value != null) {
    //   final createdTransaction = Transaction(value, accountNumber);
    //   Navigator.pop(context, createdTransaction);
    // }

    if (_validaDeposito(value)) {
      _refreshState(context, value);
      Navigator.pop(context);

    }
  }

  _validaDeposito(value) {
    return value != null;
  }

  _refreshState(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }

}
