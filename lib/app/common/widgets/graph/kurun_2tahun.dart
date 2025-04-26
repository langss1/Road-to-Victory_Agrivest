import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class HargaSapi2TahunPage extends StatelessWidget {
  const HargaSapi2TahunPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate data bulan ke-1 sampai ke-24
    final List<double> bulan = List.generate(24, (index) => (index + 1).toDouble());

    // Harga awal
    double hargaAwal = 9e6; // 9 juta

    // Set random
    final random = Random(42);

    // Gelombang sinus
    double frekuensi = 2 * pi / 12;
    double amplitudo = 350000;

    List<double> gelombang = bulan.map((b) => amplitudo * sin(frekuensi * b)).toList();

    // Tren kenaikan stabil (400.000 per bulan)
    List<double> trenKenaikan = bulan.map((b) => 400000 * b).toList();

    // Fluktuasi random
    List<double> fluktuasi = List.generate(24, (_) => random.nextDouble() * 300000 - 150000);

    // Akumulasi fluktuasi
    List<double> fluktuasiAkumulatif = [];
    double totalFluktuasi = 0;
    for (var f in fluktuasi) {
      totalFluktuasi += f;
      fluktuasiAkumulatif.add(totalFluktuasi);
    }

    // Harga final
    List<double> harga = List.generate(24, (i) =>
        hargaAwal + trenKenaikan[i] + gelombang[i] + fluktuasiAkumulatif[i]);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Harga Sapi 2 Tahun (Per Bulan)'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: LineChart(
          LineChartData(
            gridData: FlGridData(show: true, horizontalInterval: 500000),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  reservedSize: 30,
                  getTitlesWidget: (value, meta) {
                    if (value % 2 == 0 && value >= 1 && value <= 24) {
                      return Text('${value.toInt()}');
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 60,
                  getTitlesWidget: (value, meta) {
                    if (value % 5000000 == 0) {
                      return Text('Rp${(value / 1e6).toStringAsFixed(1)}jt');
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ),
            minX: 1,
            maxX: 24,
            minY: harga.reduce(min) * 0.95,
            maxY: harga.reduce(max) * 1.05,
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(harga.length, (i) => FlSpot(bulan[i], harga[i])),
                isCurved: true,
                color: Colors.lightGreen,
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: Colors.lightGreenAccent.withOpacity(0.4),
                ),
                dotData: FlDotData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
