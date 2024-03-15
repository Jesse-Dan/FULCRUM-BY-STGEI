import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AppPieChart extends StatelessWidget {
  final Map<String, double> dataMap;
  final List<Color> colorList;
  final double chartHeight;
  final double chartWidth;

  const AppPieChart({
    Key? key,
    required this.dataMap,
    required this.colorList,
    this.chartHeight = 500, // Default height
    this.chartWidth = 500, // Default width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: chartHeight,
      width: chartWidth,
      child: PieChart(
        dataMap: dataMap,
        colorList: colorList,
        chartRadius: chartWidth / 2,
        centerText: "",
        ringStrokeWidth: 24,
        animationDuration: const Duration(seconds: 3),
        chartValuesOptions: const ChartValuesOptions(
          showChartValues: true,
          showChartValuesOutside: true,
          showChartValuesInPercentage: true,
          showChartValueBackground: false,
        ),
        legendOptions: const LegendOptions(
          showLegends: true,
          legendShape: BoxShape.rectangle,
          legendTextStyle: TextStyle(fontSize: 15),
          legendPosition: LegendPosition.bottom,
          showLegendsInRow: true,
        ),
      ),
    );
  }
}
