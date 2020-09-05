import 'package:ExpenseTracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  fillColor: Colors.blueAccent, labelText: 'Title'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  fillColor: Colors.blueAccent, labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: () {
                addTx(titleController.text, double.parse(priceController.text));
              },
              child: Text('add trans'),
              textColor: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
