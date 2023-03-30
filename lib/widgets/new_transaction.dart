import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {


  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTx;

  NewTransaction({super.key, required this.addNewTx});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              // onChanged: (val) => titleInput = val,
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
            ),
            TextButton(
                onPressed: () {
                  addNewTx(titleController.text,
                      double.parse(amountController.text),);
                },
                style: TextButton.styleFrom(primary: Colors.purple),
                child: const Text(
                  "Add transaction!",
                )),
          ],
        ),
      ),
    );
  }
}
