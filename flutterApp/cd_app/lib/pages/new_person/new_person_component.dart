import 'package:cd_app/pages/shared/generic_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/pages/shared/loading_block.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/new_person_controller.dart';

class NewPersonComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPersonController>(
      init: NewPersonController(),
      builder: (controller) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Styles.mainBackgroundColor,
            body: SafeArea(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GenericAppBar(title: 'New person'),
                        Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 40, left: 20, right: 20),
                                child: TextFormField(
                                  style: TextStyle(color: Styles.mainTextColor),
                                  maxLength: 50,
                                  controller: controller.newPersonForm.name,
                                  textCapitalization: TextCapitalization.words,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return Constants
                                          .getDefaultEmptyFieldMsg();
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
                                        controller.openCountryBottomSheet(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        alignment: Alignment.center,
                                        child: Text(
                                          controller.countrySelected != null &&
                                                  controller.countrySelected
                                                      .isNotEmpty
                                              ? controller.countrySelected
                                              : Constants.emptyString,
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
                          if (controller.formKey.currentState!.validate()) {
                            controller.saveNewPerson(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Styles.primaryColor,
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
                  LoadingBlock(controller.loading),
                ],
              ),
            ));
      },
    );
  }
}

