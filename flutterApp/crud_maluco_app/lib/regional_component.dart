import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class _RegionalData {
  final String city;
  final int totalClients;

  _RegionalData(this.city, this.totalClients);
}

class RegionalComponent extends StatelessWidget {
  List<_RegionalData> _pieData = [
    _RegionalData('Rio de Janeiro', 20),
    _RegionalData('São Paulo', 50),
    _RegionalData('Minas Gerais', 10),
    _RegionalData('Acre', 2),
  ];

  final _colorPalettes = charts.MaterialPalette.getOrderedPalettes(4);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: charts.PieChart(
        [
          charts.Series<_RegionalData, String>(
            id: 'id do bagulho',
            colorFn: (_, idx) => _colorPalettes[idx].shadeDefault,
            domainFn: (_RegionalData regional, _) => regional.city,
            measureFn: (_RegionalData regional, _) => regional.totalClients,
            data: this._pieData,
            labelAccessorFn: (_RegionalData row, _) =>
                '${row.city}: ${row.totalClients}',
          ),
        ],
        animate: true,
      ),
    );
  }
}
