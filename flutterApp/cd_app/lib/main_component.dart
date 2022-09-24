import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/person_locale_graph/person_locale_component.dart';
import 'pages/person_list/person_list_component.dart';
import 'pages/new_person/new_person_component.dart';

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

GlobalKey<PersonListComponentState> personListComponentGlobalKey = GlobalKey();
GlobalKey<PersonLocaleComponentState> personLocaleGraphComponentGlobalKey = GlobalKey();

class _MainComponentState extends State<MainComponent> {
  final List<Widget> _widgetOptions = <Widget>[
    PersonListComponent(key: personListComponentGlobalKey),
    PersonLocaleComponent(key: personLocaleGraphComponentGlobalKey),
  ];

  int _selectedIndex = 0;

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  void initState() {
    super.initState();
    this.updateAppBar();
  }

  _goToNewPersonPage() async {
    var refresh = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPersonComponent()),
    );

    if (refresh != null && refresh) {
      this._refreshData();
    }
  }

  void _refreshData() {
    switch (_selectedIndex) {
      case Constants.listBottomBarOptionIndex:
        _updateListPage();
        break;

      case Constants.graphBottomBarOptionIndex:
        _updateGraphPage();
        break;

      default:
        break;
    }
  }

  _updateListPage() {
    personListComponentGlobalKey.currentState?.updatePageContent();
  }

  _updateGraphPage() {
    personLocaleGraphComponentGlobalKey.currentState?.getGraphData();
  }

  updateAppBar() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Styles.mainBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Styles.mainBackgroundColor,
      body: Container(
        child: SafeArea(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToNewPersonPage();
        },
        child: FaIcon(
          FontAwesomeIcons.plus,
          size: 22,
        ),
      ),
      floatingActionButtonLocation: this._fabLocation,
      bottomNavigationBar: this._buildBottomNavAppBar(),
    );
  }

  BottomAppBar _buildBottomNavAppBar() {
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
              color: _selectedIndex == Constants.listBottomBarOptionIndex
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
              color: _selectedIndex == Constants.graphBottomBarOptionIndex
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
}
