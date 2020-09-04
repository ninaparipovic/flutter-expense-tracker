import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'shoes',
      price: 40.49,
      purchaseDate: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'shoes',
      price: 40.99,
      purchaseDate: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
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
                  '\$${tx.price}',
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
                    DateFormat.EEEE().format(tx.purchaseDate),
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
