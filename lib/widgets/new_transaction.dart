import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final priceController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredPrice <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredPrice);

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
              controller: titleController,
              decoration: InputDecoration(
                  fillColor: Colors.blueAccent, labelText: 'Title'),
            ),
            TextField(
              controller: priceController,
              // get argument that must be accepted but is not used i.e. passing something that doens't get used
              onSubmitted: (_) => submitData(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  fillColor: Theme.of(context).primaryColor,
                  labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('add transaction'),
              textColor: Theme.of(context).primaryColorDark,
            ),
          ],
        ),
      ),
    );
  }
}
