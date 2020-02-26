import 'package:flutter/material.dart';

class InfoDialogComponent extends StatelessWidget {

  final String title;
  final String content;

  InfoDialogComponent(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: AlertDialog(
        title: Text(this.title),
        content: Text(this.content),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.deepPurple,
            onPressed: () => Navigator.pop(context, 'Ok'),
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
