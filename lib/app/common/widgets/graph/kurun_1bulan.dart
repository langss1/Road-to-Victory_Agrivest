import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class HargaSapiChart extends StatelessWidget {
  const HargaSapiChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Setup data
    final int days = 30;
    final Random random = Random(42); // Sama seperti np.random.seed(42)

    double hargaAwal = 9000000; // 9 juta
    double loc = 5000; // rata-rata naik harian
    double scale = 30000; // variasi fluktuasi

    List<FlSpot> spots = [];
    double hargaSekarang = hargaAwal;

    for (int i = 0; i < days; i++) {
      double noise = loc + random.nextDouble() * scale * (random.nextBool() ? 1 : -1);
      hargaSekarang += noise;
      spots.add(FlSpot(i + 1, hargaSekarang));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Harga Sapi (1 Bulan)'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 2, // Sama kayak xticks setiap 2 hari
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
            ),
            minX: 1,
            maxX: 30,
            minY: spots.map((e) => e.y).reduce(min) * 0.99,
            maxY: spots.map((e) => e.y).reduce(max) * 1.01,
            gridData: FlGridData(show: true, horizontalInterval: 50000),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true, // buat smooth curve
                color: const Color(0xFF6CC000),
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0xFFDFF7B0).withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
