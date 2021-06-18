import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/models/forms/new_person_form.dart';
import 'package:cd_app/pages/shared/loading_block.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'country_bottom_sheet_component.dart';

class NewPersonComponent extends StatefulWidget {
  @override
  _NewPersonComponentState createState() => _NewPersonComponentState();
}

class _NewPersonComponentState extends State<NewPersonComponent> {
  final _formKey = GlobalKey<FormState>();
  NewPersonForm newPersonForm;
  List<String> countries;
  String countrySelected;
  bool refresh;
  bool loading;

  _NewPersonComponentState() {
    this.newPersonForm = NewPersonForm();
    this.countries = Constants.countries;
    this.refresh = false;
    this.loading = false;
  }

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'New person',
            style: Styles.montTextTitle,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: EdgeInsets.all(10),
          child: InkWell(
            borderRadius: Styles.circularBorderRadius,
            onTap: () {
              this._goBack();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              child: FaIcon(
                FontAwesomeIcons.times,
                size: 22,
                color: Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _goBack() {
    Navigator.pop(context, refresh);
  }

  _saveNewPerson() {
    setState(() {
      this.loading = true;
    });

    this.refresh = true;

    this._goBack();
  }

  _openCountryBottomSheet() {
    Future<String> selectedValue = showModalBottomSheet(
        context: context,
        builder: (builder) {
          return CountryBottomSheetComponent(this.countries, countrySelected);
        });
    selectedValue.then((value) => this.changeCountry(value));
  }

  void changeCountry(String newValue) {
    if (newValue != null) {
      setState(() {
        this.countrySelected = newValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Styles.mainBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    _getAppBar(),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 40, left: 20, right: 20),
                            child: TextFormField(
                              style: TextStyle(color: Styles.mainTextColor),
                              maxLength: 50,
                              controller: newPersonForm.name,
                              textCapitalization: TextCapitalization.sentences,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return Constants.getDefaultEmptyFieldMsg();
                                }
                                return null;
                              },
                              decoration:
                                  Styles.getTextFieldDecorationUnderline(
                                      'Name'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 10, left: 20, right: 20),
                            child: Stack(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Country:',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _openCountryBottomSheet();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      countrySelected != null &&
                                              countrySelected.isNotEmpty
                                          ? countrySelected
                                          : '---',
                                      style: Styles.montText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            height: 2,
                            child: Divider(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _saveNewPerson();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Styles.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: Styles.circularBorderRadius,
                      ),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              LoadingBlock(loading),
            ],
          ),
        ));
  }
}