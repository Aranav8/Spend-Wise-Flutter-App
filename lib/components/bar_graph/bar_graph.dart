import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List weeklySummary;
  MyBarGraph({required this.weeklySummary});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      sunAmount: weeklySummary[0],
      monAmount: weeklySummary[1],
      tuesAmount: weeklySummary[2],
      wedAmount: weeklySummary[3],
      thurAmount: weeklySummary[4],
      friAmount: weeklySummary[5],
      satAmount: weeklySummary[6],
    );

    myBarData.initializeBarData();

    return BarChart(BarChartData(
      maxY: 100,
      minY: 0,
      gridData: FlGridData(
        show: false,
      ),
      borderData: FlBorderData(
        show: false,
      ),
      titlesData: FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTiles,
          ),
        ),
      ),
      barGroups: myBarData.barData
          .map(
            (data) => BarChartGroupData(
              x: data.x,
              barRods: [
                BarChartRodData(
                  toY: data.y,
                  color: Color(0xFF1E1D2E),
                  width: 25,
                  borderRadius: BorderRadius.circular(4),
                  backDrawRodData: BackgroundBarChartRodData(
                    show: true,
                    toY: 100,
                    color: Colors.grey[200],
                  ),
                )
              ],
            ),
          )
          .toList(),
    ));
  }
}

Widget getBottomTiles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = Text(
        'S',
        style: style,
      );
      break;
    case 1:
      text = Text(
        'M',
        style: style,
      );
      break;
    case 2:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 3:
      text = Text(
        'W',
        style: style,
      );
      break;
    case 4:
      text = Text(
        'T',
        style: style,
      );
      break;
    case 5:
      text = Text(
        'F',
        style: style,
      );
      break;
    case 6:
      text = Text(
        'S',
        style: style,
      );
      break;
    default:
      text = Text(
        '',
        style: style,
      );
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
