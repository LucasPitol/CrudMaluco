import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class _RegionalData {
  final String city;
  final int totalClients;

  _RegionalData(this.city, this.totalClients);
}

class RegionalComponent extends StatelessWidget {
  Map<String, double> regionalMap = {
    'São Paulo': 80,
    'Rio de Janeiro': 30,
    'Minas Gerais': 10,
    'Pernambuco': 10,
  };

  List<Color> colorList = [
    Colors.deepPurple[900],
    Colors.deepPurple,
    Colors.deepPurple[300],
    Colors.deepPurple[100],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: PieChart(
        dataMap: regionalMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32.0,
        chartRadius: MediaQuery.of(context).size.width / 2.6,
        showChartValuesInPercentage: true,
        showChartValues: true,
        showChartValuesOutside: false,
        chartValueBackgroundColor: Colors.deepPurple[50],
        colorList: colorList,
        showLegends: true,
        legendPosition: LegendPosition.right,
        decimalPlaces: 1,
        showChartValueLabel: true,
        initialAngle: 0,
        chartValueStyle: defaultChartValueStyle.copyWith(
          color: Colors.blueGrey[900].withOpacity(0.9),
        ),
        chartType: ChartType.disc,
      ),
    );
  }
}
