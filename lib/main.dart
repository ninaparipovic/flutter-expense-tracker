import 'package:ExpenseTracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // String priceInput;
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('expenses app'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.amber,
              child: Container(
                child: Text('chart'),
                width: double.infinity,
              ),
              elevation: 5,
            ),
          ),
          Card(
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
                      print(titleController.text);
                    },
                    child: Text('add trans'),
                    textColor: Colors.lightGreen,
                  ),
                ],
              ),
            ),
          ),
          TransactionList()
        ],
      ),
    );
  }
}
