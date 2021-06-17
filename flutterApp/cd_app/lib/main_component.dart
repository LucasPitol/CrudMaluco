import 'package:cd_app/pages/person_list_component.dart';
import 'package:cd_app/utils/constants.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainComponent extends StatefulWidget {
  @override
  _MainComponentState createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  final List<Widget> _widgetOptions = <Widget>[
    PersonListComponent(),
    Container(),
  ];

  int _selectedIndex = 0;

  FloatingActionButton _fab = FloatingActionButton(
    onPressed: () {
      print('Add');
    },
    child: FaIcon(
      FontAwesomeIcons.plus,
      size: 22,
    ),
  );

  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.centerDocked;

  @override
  void initState() {
    super.initState();
    this.updateAppBar();
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
      floatingActionButton: _fab,
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
