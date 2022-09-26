import 'package:cd_app/models/forms/new_person_form.dart';
import 'package:cd_app/pages/new_person/components/country_bottom_sheet_component.dart';
import 'package:cd_app/pages/shared/info_dialog.dart';
import 'package:cd_app/services/person_service.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewPersonController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late PersonService _personService = PersonService();
  late NewPersonForm newPersonForm = NewPersonForm();
  late List<String> countries = Constants.countries;
  late String countrySelected = Constants.countries[0];
  late bool refreshing = false;
  late bool loading = false;

  goBack() {
    Get.back(result: true);
  }

  saveNewPerson(context) {
    FocusScope.of(context).unfocus();

    this.loading = true;

    update();

    if (countrySelected == null) {
      openInfoDialog('Opss...', 'Choose a country', context);

      this.loading = false;

      update();
    } else {
      this.refreshing = true;

      this.newPersonForm.country = countrySelected;

      _personService.createNewPerson(newPersonForm).then((success) {
        if (success) {
          this.goBack();
        } else {
          openInfoDialog('Opss...',
              'Unable to save this person :( \n Try again later.', context);

          this.loading = false;

          update();
        }
      });
    }
  }

  Future<void> openInfoDialog(String title, String content, context) async {
    await showDialog<String>(
        context: context,
        builder: (builder) {
          return AlertDialogComponent(title, content);
        });
  }

  openCountryBottomSheet(context) {
    Future<dynamic> selectedValue = showModalBottomSheet(
        context: context,
        builder: (builder) {
          return CountryBottomSheetComponent(this.countries, countrySelected);
        });
    selectedValue.then((value) => this.changeCountry(value));
  }

  void changeCountry(String newValue) {
    if (newValue != null) {
      this.countrySelected = newValue;
      update();
    }
  }
}
