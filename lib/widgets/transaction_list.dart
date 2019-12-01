import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
    final List<Transaction> transactions;

    TransactionList(this.transactions);

    @override
    Widget build(BuildContext context) {
        return Container(
            child: Column(
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
                }).toList()
            ),
        );
    }
}