import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'shoes',
      price: 40,
      purchaseDate: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'shoes',
      price: 40,
      purchaseDate: DateTime.now(),
    ),
  ];

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
          Card(
            color: Colors.amber,
            child: Container(
              child: Text('chart'),
              width: double.infinity,
            ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 50,
                    ),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple, width: 0.5),
                    ),
                    child: Text(
                      tx.price.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        tx.purchaseDate.toString(),
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ],
                  )
                ],
              ));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
