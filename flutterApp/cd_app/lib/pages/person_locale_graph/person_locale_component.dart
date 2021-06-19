import 'package:cd_app/services/person_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';

import 'pie_chart_component.dart';

class PersonLocaleComponent extends StatefulWidget {
  PersonLocaleComponent({Key key}) : super(key: key);

  @override
  PersonLocaleComponentState createState() => PersonLocaleComponentState();
}

class PersonLocaleComponentState extends State<PersonLocaleComponent> {
  Map<String, double> personLocaleMap;
  PersonService _personService;

  bool loading = true;

  PersonLocaleComponentState() {
    this.personLocaleMap = Map<String, double>();
    this._personService = PersonService();
  }

  @override
  void initState() {
    super.initState();
    this.getGraphData();
  }

  getGraphData() async {
    setState(() {
      this.loading = true;
    });

    this.personLocaleMap = await this._personService.getPersonLocaleGraphData();

    setState(() {
      this.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
            margin: EdgeInsets.symmetric(vertical: 60),
            width: double.infinity,
            alignment: Alignment.center,
            child: Theme(
              data: Theme.of(context).copyWith(
                accentColor: Styles.primaryColor,
              ),
              child: new CircularProgressIndicator(),
            ),
          )
        : Container(
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
                      this.getGraphData();
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
