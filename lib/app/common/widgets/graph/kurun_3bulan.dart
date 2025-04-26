import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MaterialApp(
    home: HargaSapiChart(),
  ));
}

class HargaSapiChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<FlSpot> dataPoints = generateHargaSapiData();

    return Scaffold(
      appBar: AppBar(
        title: Text('Grafik Harga Sapi 3 Bulan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minX: 1,
            maxX: 90,
            minY: dataPoints.map((e) => e.y).reduce(min) * 0.95,
            maxY: dataPoints.map((e) => e.y).reduce(max) * 1.05,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  interval: 10,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 50,
                  getTitlesWidget: (value, meta) {
                    return Text('${(value / 1e6).toStringAsFixed(1)}jt');
                  },
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 200000,
              verticalInterval: 10,
            ),
            borderData: FlBorderData(show: true),
            lineBarsData: [
              LineChartBarData(
                spots: dataPoints,
                isCurved: true,
                color: Color(0xFF6CC000),
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: Color(0xFFDFF7B0).withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Generates mock data for the chart.
  List<FlSpot> generateHargaSapiData() {
    final List<FlSpot> spots = [];
    final Random random = Random(42); // Seed for consistent results
    double hargaAwal = 9e6; // Initial price
    double harga = hargaAwal;
    double cumulativeFluctuation = 0;

    for (int day = 1; day <= 90; day++) {
      double frequency = 2 * pi / 45; // Frequency for sine wave
      double amplitude = 200000; // Amplitude for sine wave
      double gelombang = amplitude * sin(frequency * day); // Sine wave
      double trenKenaikan = 50000.0 * day; // Upward trend
      double fluktuasi =
          random.nextDouble() * 40000 - 20000; // Random fluctuation
      cumulativeFluctuation += fluktuasi;

      harga = hargaAwal + trenKenaikan + gelombang + cumulativeFluctuation;
      spots.add(FlSpot(day.toDouble(), harga));
    }

    return spots;
  }
}
