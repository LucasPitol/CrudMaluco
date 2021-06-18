import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'pie_chart_component.dart';

class PersonLocaleComponent extends StatefulWidget {
  @override
  _PersonLocaleComponentState createState() => _PersonLocaleComponentState();
}

class _PersonLocaleComponentState extends State<PersonLocaleComponent> {
  Map<String, double> personLocaleMap;


  _PersonLocaleComponentState() {
    this.personLocaleMap = Map<String, double>();
  }

  @override
  void initState() {
    super.initState();
    this.getGraphData();
  }

  getGraphData() {
    Map<String, double> dataMap = {
      "Brazil": 5,
      "Netherlands": 3,
      "Portugal": 2,
      "France": 2,
    };

    this.personLocaleMap = dataMap;
  }

  _refresh() {
    print('Refresh');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: PieChartComponent(this.personLocaleMap),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.all(10),
            child: InkWell(
              borderRadius: Styles.circularBorderRadius,
              onTap: () {
                this._refresh();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: FaIcon(
                  FontAwesomeIcons.redo,
                  size: 20,
                  color: Styles.mainTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
