import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final priceController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredPrice = double.parse(priceController.text);

    if (enteredTitle.isEmpty || enteredPrice <= 0) {
      return;
    }
    addTx(enteredTitle, enteredPrice);
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
                  fillColor: Colors.blueAccent, labelText: 'Amount'),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text('add trans'),
              textColor: Colors.lightGreen,
            ),
          ],
        ),
      ),
    );
  }
}
