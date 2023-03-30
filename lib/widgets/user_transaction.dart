import 'package:flutter/material.dart';
import 'package:personal_experience_app/widgets/transaction_list.dart';

import '../model/transaction.dart';
import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "f1",
      title: "new shirt",
      amount: 13.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: "f32",
      title: "new shoes",
      amount: 31.45,
      date: DateTime.now(),
    ),
  ];

  void _addNew(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addNewTx: _addNew),
        TransactionList(_userTransaction),
      ],
    );
  }
}
