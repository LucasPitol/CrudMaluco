import 'package:cd_app/models/forms/new_person_form.dart';
import 'package:cd_app/models/person.dart';
import 'package:cd_app/pages/new_person/country_bottom_sheet_component.dart';
import 'package:cd_app/pages/shared/loading_block.dart';
import 'package:cd_app/services/person_service.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class EditPersonComponent extends StatefulWidget {
  final Person person;
  final Function switchRefresh;

  EditPersonComponent({this.person, this.switchRefresh});

  @override
  _EditPersonComponentState createState() => _EditPersonComponentState(
        person: person,
        switchRefresh: switchRefresh,
      );
}

class _EditPersonComponentState extends State<EditPersonComponent> {
  final Person person;
  final Function switchRefresh;
  final _formKey = GlobalKey<FormState>();

  PersonService _personService;
  NewPersonForm newPersonForm;
  String countrySelected;
  List<String> countries;
  bool loading;

  _EditPersonComponentState({this.person, this.switchRefresh}) {
    this._personService = PersonService();
    this.newPersonForm = NewPersonForm();
    this.countries = Constants.countries;
    this.loading = false;
  }

  void initState() {
    super.initState();
    this._buildForm();
  }

  _buildForm() {
    this.newPersonForm.name.text = person.name;
    this.countrySelected = person.country;
  }

  _getAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'Edit person',
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
    Navigator.pop(context);
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

  _saveChanges() {
    FocusScope.of(context).unfocus();

    setState(() {
      this.loading = true;
    });

    this.switchRefresh();

    this.newPersonForm.country = countrySelected;

    _personService.editPerson(person.id, newPersonForm).then((success) {
      if (success) {
        this._goBack();
      } else {
        // error modal
        setState(() {
          this.loading = false;
        });
      }
    });
  }

  _deletePerson() {
    setState(() {
      this.loading = true;
    });

    this.switchRefresh();

    _personService.deletePerson(person.id).then((success) {
      if (success) {
        this._goBack();
      } else {
        // error modal
        setState(() {
          this.loading = false;
        });
      }
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
                          margin: EdgeInsets.only(top: 40, left: 20, right: 20),
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
                                Styles.getTextFieldDecorationUnderline('Name'),
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
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  alignment: Alignment.center,
                                  child: Text(
                                    countrySelected,
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
                        Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 80),
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              this._deletePerson();
                            },
                            child: Text(
                              'Delete person',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(
                              left: 20, right: 20, top: 80, bottom: 60),
                          child: Text(
                            'Created: ' +
                                DateFormat.yMd()
                                    .add_jm()
                                    .format(person.creationDate),
                            style: Styles.montTextLight,
                          ),
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
                      _saveChanges();
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
      ),
    );
  }
}
