import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Personal Expenses',
            theme: ThemeData(
                accentColor: Colors.purple,
                primarySwatch: Colors.yellow,
                secondaryHeaderColor: Colors.lightBlue,
                fontFamily: 'Quicksand',
            ),
            home: MyHomePage(title: 'Personal Expenses'),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    final List<Transaction> _userTransactions = [
        Transaction(
            id: 't1', title: 'New Shoes', amount: 53.32, date: DateTime.now()),
        Transaction(
            id: 't12', title: 'Something', amount: 23.33, date: DateTime.now()),
    ];

    void _addNewTransaction(String  title, double amount) {
        final newTransaction = Transaction(
            title: title,
            amount: amount,
            date: DateTime.now(),
            id: DateTime.now().toString(),
        );

        setState(() {
            this._userTransactions.add(newTransaction);
        });
    }

    void _startAddNewTransaction(BuildContext ctx) {
        showModalBottomSheet(
            context: ctx,
            builder: (_) {
                return NewTransaction(this._addNewTransaction);
            }
        );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(this.widget.title),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(
                            Icons.add,
                        ),
                        onPressed: () => this._startAddNewTransaction(context),
                    )
                ],
            ),
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                        Container(
                            child: Card(child: Text('Chart')),
                        ),
                        TransactionList(this._userTransactions)
                    ],
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () => this._startAddNewTransaction(context),
            ),
        );
    }
}
