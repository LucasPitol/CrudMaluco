import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_maluco_app/services/client_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'default_app_bar.dart';
import 'info_dialog_component.dart';
import 'models/clinet_form.dart';

class AddClientComponent extends MaterialPageRoute<String> {
  AddClientComponent()
      : super(builder: (BuildContext context) {
          ClientForm _clientForm = new ClientForm();

          final ClientService clientService = new ClientService();

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

          Future<void> _validateForm() async {
            bool valid = true;

            await clientService.save(_clientForm);

            if (valid) {
              _openInfoDialog('Success', 'New client added');
              Navigator.pop(context);
            }

            // if (!valid) {
            //   _openInfoDialog('Fail', 'Must complete the form');
            // }
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
                      //select
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
                      //Date pick
                      Container(
                        margin: EdgeInsets.all(10),
                        child: FlatButton(
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              theme: DatePickerTheme(
                                doneStyle: TextStyle(color: Colors.deepPurple),
                              ),
                              showTitleActions: true,
                              minTime: DateTime(1810, 1, 1),
                              maxTime: DateTime.now(),
                              locale: LocaleType.en,
                              onChanged: (date) {
                                _clientForm.birthDate = date as Timestamp;
                              },
                              onConfirm: (date) {
                                _clientForm.birthDate = date as Timestamp;
                              }
                            );
                          },
                          child: Text(
                            'Birth Date',
                            style: TextStyle(color: Colors.deepPurple),
                          ),
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
