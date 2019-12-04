import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
    final addTransactionCallback;

    NewTransaction(this.addTransactionCallback);

    @override
    _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
    final titleController = TextEditingController();

    final amountController = TextEditingController();

    void submitData() {
        final title = this.titleController.text;
        final amount = double.parse(this.amountController.text);

        if (title.isEmpty || amount <= 0) {
            return;
        }

        this.widget.addTransactionCallback(title, amount);

        Navigator.of(context).pop();
    }

    @override
    Widget build(BuildContext context) {
        return Card(
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
                            onSubmitted: (_) => this.submitData(),
                        ),
                        TextField(
                            decoration: InputDecoration(
                                labelText: 'Amount',
                            ),
                            controller: this.amountController,
                            onSubmitted: (_) => this.submitData(),
                            keyboardType: TextInputType.numberWithOptions(decimal: true),
                        ),
                        FlatButton(
                            child: Text('Add Transaction'),
                            onPressed: this.submitData,
                            textColor: Colors.purple,
                        ),
                    ],
                ),
            ),
        );
    }
}
