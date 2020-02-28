import 'package:flutter/material.dart';

import 'info_dialog_component.dart';
import 'models/clinet_form.dart';

class AddClientComponent extends MaterialPageRoute<String> {
  AddClientComponent()
      : super(builder: (BuildContext context) {
          ClientForm _clientForm = new ClientForm();

          void _openInfoDialog() {
            showDialog<String>(
                context: context,
                builder: (builder) {
                  return InfoDialogComponent('Info', 'Massa');
                });
          }

          void _clearForm() {
            _clientForm.name.clear();
          }

          return Scaffold(
            resizeToAvoidBottomPadding: false,
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
                    onTap: _openInfoDialog,
                    child: Icon(
                      Icons.info,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            // body: SingleChildScrollView(child: YourBody()),
            body: Column(
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    primaryColor: Colors.deepPurple,
                    cursorColor: Colors.black,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: _clientForm.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              textColor: Colors.deepPurple,
                              child: Text('Clear'),
                              onPressed: _clearForm,
                              padding: EdgeInsets.only(left: 10, right: 10),
                            ),
                            RaisedButton(
                              color: Colors.deepPurple,
                              onPressed: _openInfoDialog,
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
}
