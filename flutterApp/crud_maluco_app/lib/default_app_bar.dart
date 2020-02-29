import 'package:flutter/material.dart';
import 'info_dialog_component.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final BuildContext context;

  @override
  final Size preferredSize;

  DefaultAppBar(this.context) : preferredSize = Size.fromHeight(60.0);

  void _openInfoDialog(String title, String content) {
    showDialog<String>(
        context: context,
        builder: (builder) {
          return InfoDialogComponent(title, content);
        });
  }

  void _openInfoDialogAux() {
    _openInfoDialog('Info', 'Massa!');
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Crud Maluco',
        style: TextStyle(color: Colors.black),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: _openInfoDialogAux,
            child: Icon(
              Icons.info,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
