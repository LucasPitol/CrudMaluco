import 'package:flutter/material.dart';

class AddClientModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SimpleDialog(
        title: Text('Add new client'),
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),
          ),
        ],
      ),
    );
  }

}