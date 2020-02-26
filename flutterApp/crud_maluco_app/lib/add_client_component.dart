import 'package:flutter/material.dart';

import 'info_dialog_component.dart';

class AddClientComponent extends MaterialPageRoute<String> {
  AddClientComponent()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
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
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (builder) {
                          return InfoDialogComponent('Info', 'Massa');
                        },
                      );
                    },
                    child: Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            body: Column(
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
        });
}
