import 'package:flutter/material.dart';
import 'package:personal_experience_app/widgets/chart.dart';
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

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((element) {
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void _addNew(String title, double amount, DateTime choseDate) {
    final newTx = Transaction(
      id: DateTime.now.toString(),
      title: title,
      amount: amount,
      date: choseDate,
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
  void _deleteTransaction(String id){
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
                primarySwatch: Colors.purple,
                primaryColor: Colors.purple,
                fontFamily: "Quicksand")
            .copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.purple, primary: Colors.purple),
          ),
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
                Chart(_recentTransactions),
                TransactionList(_userTransaction,_deleteTransaction)
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
