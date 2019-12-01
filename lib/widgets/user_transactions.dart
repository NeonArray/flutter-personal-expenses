import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
    @override
    _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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

    @override
    Widget build(BuildContext context) {
        return Column(
            children: <Widget>[
                NewTransaction(this._addNewTransaction),
                TransactionList(this._userTransactions),
            ],
        );
    }
}
