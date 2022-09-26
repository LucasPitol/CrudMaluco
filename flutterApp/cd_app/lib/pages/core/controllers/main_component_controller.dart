import 'package:cd_app/pages/person_locale_graph/person_locale_component.dart';
import 'package:cd_app/pages/person_list/person_list_component.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/routes/app_pages.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainComponentController extends GetxController {
  
  final List<Widget> widgetOptions = <Widget>[
    PersonListComponent(),
    PersonLocaleComponent(),
  ];

  int selectedIndex = 0;

  FloatingActionButtonLocation fabLocation =
      FloatingActionButtonLocation.centerDocked;

  goToNewPersonPage() async {
    var refresh = await Get.toNamed(AppRoutes.newPerson);

    if (refresh != null && refresh) {
      this._refreshData();
    }
  }

  updateAppBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Styles.mainBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void _onItemTapped(int index) {
    selectedIndex = index;

    update();
  }

  void _refreshData() {
    update();
  }

  BottomAppBar buildBottomNavAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Styles.mainBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.list,
              size: 22,
              color: selectedIndex == Constants.listBottomBarOptionIndex
                  ? Styles.primaryColor
                  : Colors.grey.shade300,
            ),
            onPressed: () {
              this._onItemTapped(Constants.listBottomBarOptionIndex);
            },
          ),
          Container(
            width: 24,
            height: 24,
          ),
          IconButton(
            icon: FaIcon(
              FontAwesomeIcons.chartPie,
              size: 22,
              color: selectedIndex == Constants.graphBottomBarOptionIndex
                  ? Styles.primaryColor
                  : Colors.grey.shade300,
            ),
            onPressed: () {
              this._onItemTapped(Constants.graphBottomBarOptionIndex);
            },
          ),
        ],
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    this.updateAppBar();
  }

  @override
  void onReady() async {
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    update();
    super.dispose();
  }
}
