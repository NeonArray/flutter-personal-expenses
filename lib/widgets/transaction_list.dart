import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: this.transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${this.transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      this.transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(DateFormat.yMMMd()
                        .format(this.transactions[index].date)),
                    trailing: IconButton(
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                      onPressed: () =>
                          this.deleteTransaction(this.transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: this.transactions.length,
            ),
    );
  }
}
