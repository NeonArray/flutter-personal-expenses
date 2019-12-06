import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final addTransactionCallback;

  NewTransaction(this.addTransactionCallback);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _presentDatePicker() {
    showDatePicker(
      context: this.context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        this._selectedDate = pickedDate;
      });
    });
  }

  void _submitData() {
    final title = this._titleController.text;
    final amount = double.parse(this._amountController.text);

    if (title.isEmpty || amount <= 0 || this._selectedDate == null) {
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
              controller: this._titleController,
              onSubmitted: (_) => this._submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: this._amountController,
              onSubmitted: (_) => this._submitData(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(this._selectedDate == null
                        ? 'No date chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(this._selectedDate)}'),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: this._presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
              child: Text('Add Transaction'),
              onPressed: this._submitData,
            ),
          ],
        ),
      ),
    );
  }
}
