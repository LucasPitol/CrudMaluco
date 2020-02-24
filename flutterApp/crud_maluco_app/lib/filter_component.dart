import 'package:flutter/material.dart';

class FilterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      height: 300,
      child: Column(
        children: <Widget>[
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: ButtonBar(
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  textColor: Colors.deepPurple,
                  child: Text('Clear'),
                  onPressed: () {},
                  padding: EdgeInsets.only(left: 10, right: 10),
                ),
                RaisedButton(
                  color: Colors.deepPurple,
                  onPressed: () {},
                  child: Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
