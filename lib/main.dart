import 'package:ExpenseTracker/widgets/new_transaction.dart';
import 'package:ExpenseTracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        primarySwatch: Colors.amber,
        accentColor: Colors.yellow,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 30,
              )),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final priceController = TextEditingController();

  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      price: txAmount,
      purchaseDate: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
        title: Text(
          'Personal Expenses',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColorDark,
                child: Container(
                  child: Text(
                    'chart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  width: double.infinity,
                ),
                elevation: 5,
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
