class Transaction {
  final double value;
  final int accountNumber;

  Transaction(
    this.value,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Transferencia {valor: $value, numeroConta: $accountNumber}';
  }

  String valueToString() {
    return 'R\$ $value';
  }

  String accountNumberToString() {
    return 'Account: $accountNumber';
  }
}
