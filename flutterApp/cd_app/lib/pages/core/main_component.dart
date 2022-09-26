import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/main_component_controller.dart';

class MainComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainComponentController>(
      init: MainComponentController(),
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Styles.mainBackgroundColor,
          body: Container(
            child: SafeArea(
              child:
                  controller.widgetOptions.elementAt(controller.selectedIndex),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.goToNewPersonPage();
            },
            child: FaIcon(
              FontAwesomeIcons.plus,
              size: 22,
            ),
          ),
          floatingActionButtonLocation: controller.fabLocation,
          bottomNavigationBar: controller.buildBottomNavAppBar(),
        );
      },
    );
  }
}
