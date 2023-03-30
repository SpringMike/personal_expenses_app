import 'package:flutter/material.dart';
import 'package:personal_experience_app/widgets/new_transaction.dart';
import 'package:personal_experience_app/widgets/transaction_list.dart';

import 'model/transaction.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

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
    Transaction(
      id: "f33",
      title: "new shoes 2",
      amount: 11.45,
      date: DateTime.now(),
    ),
    Transaction(
      id: "f333",
      title: "new shoes 3",
      amount: 11.25,
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

  void _startAddNewTransaction(BuildContext buildContext) {
    showModalBottomSheet(
        context: buildContext,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(addNewTx: _addNew),
          );
        });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: "Quicksand"
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter App'),
            actions: <Widget>[
              IconButton(
                onPressed: () => _startAddNewTransaction(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    alignment: Alignment.center,
                    color: Theme.of(context).primaryColor,
                    child: const Text("Chart"),
                  ),
                ),
                TransactionList(_userTransaction)
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () => _startAddNewTransaction(context),
            child: const Icon(Icons.add),
          ),
        ));
  }
}
