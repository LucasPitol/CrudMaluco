import 'package:flutter/material.dart';

import 'default_app_bar.dart';
import 'info_dialog_component.dart';
import 'models/clinet_form.dart';

class AddClientComponent extends MaterialPageRoute<String> {
  AddClientComponent()
      : super(builder: (BuildContext context) {
          ClientForm _clientForm = new ClientForm();

          String selectedCity;

          List<String> citiesList = [
            'Belem do Pará',
            'Pernambuco',
            'Rio de Janeiro',
            'São Paulo'
          ];

          void _openInfoDialog(String title, String content) {
            showDialog<String>(
                context: context,
                builder: (builder) {
                  return InfoDialogComponent(title, content);
                });
          }

          void _clearForm() {
            _clientForm.name.clear();
            _clientForm.address.clear();
            _clientForm.cidade.clear();
            _clientForm.cpf.clear();
            _clientForm.email.clear();
          }

          void _validateForm() {
            bool valid = false;

            if (!valid) {
              _openInfoDialog('Fail', 'Must complete the form');
            }
          }

          return Scaffold(
            resizeToAvoidBottomPadding: false,
            appBar: DefaultAppBar(context),
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
                          controller: _clientForm.email,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: _clientForm.cpf,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CPF',
                          ),
                        ),
                      ),
                      //TODO: Date pick
                      Container(
                        margin: EdgeInsets.all(10),
                        child: TextField(
                          controller: _clientForm.address,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Address',
                          ),
                        ),
                      ),
                      //TODO: select
                      Container(
                        margin: EdgeInsets.all(10),
                        child: DropdownButton<String>(
                          hint: Text('City'),
                          value: selectedCity,
                          items: citiesList.map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            selectedCity = newValue;
                            _clientForm.cidade.text = newValue;
                          },
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: OutlineButton(
                                textColor: Colors.deepPurple,
                                child: Text('Clear'),
                                onPressed: _clearForm,
                                // padding: EdgeInsets.only(left: 10, right: 10),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: RaisedButton(
                                color: Colors.deepPurple,
                                onPressed: _validateForm,
                                child: Text(
                                  'Add',
                                  style: TextStyle(color: Colors.white),
                                ),
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
