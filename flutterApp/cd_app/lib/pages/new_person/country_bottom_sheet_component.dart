import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

class CountryBottomSheetComponent extends StatefulWidget {
  final List<String> countryList;
  final String previousCountrySelectedValue;

  CountryBottomSheetComponent(
      this.countryList, this.previousCountrySelectedValue);

  @override
  _CountryBottomSheetComponentState createState() =>
      _CountryBottomSheetComponentState(
          countryList, previousCountrySelectedValue);
}

class _CountryBottomSheetComponentState
    extends State<CountryBottomSheetComponent> {
  final List<String> countryList;
  String previousCountrySelectedValue;

  _CountryBottomSheetComponentState(
      this.countryList, this.previousCountrySelectedValue);

  void _selectCountry(String value) {
    setState(() {
      previousCountrySelectedValue = value;
    });
    Navigator.pop(context, value);
  }

  Widget createTile(String item) {
    bool isCountrySelected = item == previousCountrySelectedValue;

    return Container(
      child: InkWell(
        onTap: () {
          this._selectCountry(item);
        },
        child: Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: isCountrySelected
                ? Styles.lightColor
                : Styles.mainBackgroundColor,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              item,
              style: TextStyle(
                fontSize: 16,
                color: isCountrySelected
                    ? Styles.mainBackgroundColor
                    : Styles.mainTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Styles.mainBackgroundColor,
      height: 220,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Icon(
              Icons.maximize,
              color: Colors.grey.shade200,
              size: 50,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                      this.countryList.map((item) => createTile(item)).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
