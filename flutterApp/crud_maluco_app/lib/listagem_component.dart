import 'package:flutter/material.dart';

class ListagemComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 50),
      child: Column(
        children: <Widget>[
          Text(
            'listagem',
            style: TextStyle(fontFamily: 'RobotoMono', fontSize: 21),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
