import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const TransactionAuthDialog({@required this.onConfirm});

  @override
  _TransactionAuthDialogState createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authenticate'),
      content: TextField(
        controller: _passwordEditController,
        obscureText: true,
        maxLength: 4,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(border: OutlineInputBorder()),
        textAlign: TextAlign.center,
        style: TextStyle(
          letterSpacing: 20,
          fontSize: 60,
        ),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            print('cancel');
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_passwordEditController.text);
            Navigator.pop(context);
          },
          child: Text('Confirm'),
        )
      ],
    );
  }
}
