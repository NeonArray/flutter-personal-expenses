import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class MyHomePage extends StatelessWidget {
    MyHomePage({Key key, this.title}) : super(key: key);

    final String title;
    final List<Transaction> transactions = [
        Transaction(
            id: 't1', title: 'New Shoes', amount: 53.32, date: DateTime.now()),
        Transaction(
            id: 't12', title: 'Something', amount: 23.33, date: DateTime.now()),
    ];
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text(this.title),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                Container(
                    child: Card(child: Text('Chart')),
                ),
                Card(
                    elevation: 5,
                    child: Container(
                       padding: EdgeInsets.all(10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                                TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Title',
                                    ),
                                    controller: this.titleController,
                                ),
                                TextField(
                                    decoration: InputDecoration(
                                        labelText: 'Amount',
                                    ),
                                    controller: this.amountController,
                                ),
                                FlatButton(
                                    child: Text('Add Transaction'),
                                    onPressed: () {
                                        print(this.titleController.text);
                                    },
                                    textColor: Colors.purple,
                                ),
                            ],
                        ),
                    ),
                ),
                Column(
                    children: this.transactions.map((tx) {
                        return Card(
                            child: Row(
                                children: <Widget>[
                                    Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.purple,
                                                width: 2,
                                            ),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                        child: Text(
                                            '\$${tx.amount}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.purple,
                                            ),
                                        ),
                                    ),
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                            Text(
                                                tx.title,
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.normal,
                                                )
                                            ),
                                            Text(
                                                DateFormat.yMMMd().format(tx.date),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.italic,
                                                    color: Colors.grey,
                                                )
                                            ),
                                        ],
                                    )
                                ],
                            ));
                    }).toList(),
                )
            ]),
        );
    }
}
