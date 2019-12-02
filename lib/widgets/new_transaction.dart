import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
    final addTransactionCallback;
    final titleController = TextEditingController();
    final amountController = TextEditingController();

    NewTransaction(this.addTransactionCallback);

    void submitData() {
        final title = this.titleController.text;
        final amount = double.parse(this.amountController.text);

        if (title.isEmpty || amount <= 0) {
            return;
        }

        this.addTransactionCallback(title, amount);
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
