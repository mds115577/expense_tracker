import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  const BarGraph({super.key});

  @override
  Widget build(BuildContext context) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return Card(
      color: const Color(0xFF3E2248),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'August',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Exp', style: TextStyle(color: Colors.orangeAccent)),
                    Text('25000', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Text('Bal', style: TextStyle(color: Colors.blueAccent)),
                    Text('+5000', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Text('Inc', style: TextStyle(color: Colors.orangeAccent)),
                    Text('30000', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 2.2,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 35000,
                  barGroups: [
                    for (int i = 0; i < months.length; i++)
                      BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: (i == 0)
                                ? 1.0
                                : (i == 7 ? 25000 : (i * 4000).toDouble()),
                            color: i == 7
                                ? Colors.orangeAccent
                                : Colors.white.withOpacity(0.5),
                            width: 10,
                          ),
                        ],
                      ),
                  ],
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              months[value.toInt()],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
