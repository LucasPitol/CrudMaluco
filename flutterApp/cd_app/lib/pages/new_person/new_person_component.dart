import 'package:cd_app/pages/shared/info_dialog.dart';
import 'package:cd_app/services/person_service.dart';
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
  PersonService _personService;
  NewPersonForm newPersonForm;
  List<String> countries;
  String countrySelected;
  bool refresh;
  bool loading;

  _NewPersonComponentState() {
    this._personService = PersonService();
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
    FocusScope.of(context).unfocus();

    setState(() {
      this.loading = true;
    });

    if (countrySelected == null) {
      _openInfoDialog('Opss...', 'Choose a country');

      setState(() {
        this.loading = false;
      });
    } else {
      this.refresh = true;

      this.newPersonForm.country = countrySelected;

      _personService.createNewPerson(newPersonForm).then((success) {
        if (success) {
          this._goBack();
        } else {
          _openInfoDialog(
              'Opss...', 'Unable to save this person :( \n Try again later.');
          setState(() {
            this.loading = false;
          });
        }
      });
    }
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

  Future<void> _openInfoDialog(String title, String content) async {
    await showDialog<String>(
        context: context,
        builder: (builder) {
          return AlertDialogComponent(title, content);
        });
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
                              textCapitalization: TextCapitalization.words,
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
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
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
