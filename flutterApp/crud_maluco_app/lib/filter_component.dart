import 'package:flutter/material.dart';

class FilterComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      alignment: Alignment.center,
      constraints: BoxConstraints(
        minHeight: 100
      ),
      // margin: EdgeInsets.only(top: 20),
      // decoration: new BoxDecoration(
      //   color: Colors.red,
      //   // shape: BoxShape.rectangle,
      //   borderRadius: new BorderRadius.only(
      //     topLeft: Radius.circular(40.0),
      //     topRight: Radius.circular(40.0),
      //   ),
      // ),
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
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
