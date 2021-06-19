import 'package:cd_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartComponent extends StatefulWidget {
  final Map<String, double> personLocaleMap;

  PieChartComponent(this.personLocaleMap);

  @override
  _PieChartComponentState createState() => _PieChartComponentState();
}

class _PieChartComponentState extends State<PieChartComponent> {
  List<Color> colorList = [
    Styles.darkColor,
    Styles.primaryColor,
    Styles.lightColor,
    Color(0xffE3E1FF),
  ];

  @override
  Widget build(BuildContext context) {
    return (widget.personLocaleMap != null && widget.personLocaleMap.isNotEmpty)
        ? Container(
            alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 20),
            child: PieChart(
              dataMap: this.widget.personLocaleMap,
              animationDuration: Duration(milliseconds: 800),
              chartLegendSpacing: 32.0,
              chartRadius: MediaQuery.of(context).size.width / 2.6,
              colorList: colorList,
              initialAngleInDegree: 0,
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
                showChartValues: true,
                showChartValuesOutside: false,
                chartValueBackgroundColor: Colors.white,
                decimalPlaces: 1,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.grey.shade900.withOpacity(0.9),
                ),
              ),
              legendOptions: LegendOptions(
                legendTextStyle: Styles.montTextLittle,
                legendShape: BoxShape.circle,
                showLegends: true,
              ),
              chartType: ChartType.disc,
            ),
          )
        : Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'no person to show, tap the add button to create one.',
              style: Styles.montTextLight,
              textAlign: TextAlign.center,
            ),
          );
  }
}
