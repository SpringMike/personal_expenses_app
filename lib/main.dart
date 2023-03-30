import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_experience_app/widgets/new_transaction.dart';
import 'package:personal_experience_app/widgets/transaction_list.dart';
import 'package:personal_experience_app/widgets/user_transaction.dart';
import 'model/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
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
                color: Colors.blue,
                child: const Text("Chart"),
              ),
            ),
            const UserTransaction(),
          ],
        ),
      ),
    ));
  }
}
