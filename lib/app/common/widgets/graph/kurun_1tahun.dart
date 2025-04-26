import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class HargaSapi1TahunChart extends StatefulWidget {
  const HargaSapi1TahunChart({super.key});

  @override
  State<HargaSapi1TahunChart> createState() => _HargaSapi1TahunChartState();
}

class _HargaSapi1TahunChartState extends State<HargaSapi1TahunChart> {
  late List<FlSpot> spots;

  @override
  void initState() {
    super.initState();
    spots = generateData();
  }

  List<FlSpot> generateData() {
    final List<FlSpot> data = [];
    final random = Random(42); // seed biar konsisten

    // Parameter
    const int totalHari = 365;
    const double hargaAwal = 9000000; // 9 juta
    const double trenKenaikanPerHari = 25000; // 25 ribu per hari
    const double amplitudo = 250000; // fluktuasi sinus
    final double frekuensi = 2 * pi / 90; // 4 siklus dalam setahun

    double harga = hargaAwal;
    double fluktuasiAkumulatif = 0;

    for (int hari = 1; hari <= totalHari; hari++) {
      // Gelombang naik-turun
      double gelombang = amplitudo * sin(frekuensi * hari);

      // Fluktuasi random kecil
      double fluktuasi = random.nextDouble() * 60000 - 30000; // -30rb sampai +30rb
      fluktuasiAkumulatif += fluktuasi;

      harga = hargaAwal + (trenKenaikanPerHari * hari) + gelombang + fluktuasiAkumulatif;

      data.add(FlSpot(hari.toDouble(), harga));
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grafik Harga Sapi 1 Tahun'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LineChart(
          LineChartData(
            minX: 1,
            maxX: 365,
            minY: spots.map((e) => e.y).reduce(min) - 200000,
            maxY: spots.map((e) => e.y).reduce(max) + 200000,
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                color: const Color(0xFF6CC000),
                barWidth: 3,
                belowBarData: BarAreaData(
                  show: true,
                  color: const Color(0xFFDFF7B0).withOpacity(0.5),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: true, reservedSize: 60),
              ),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 40,
                  interval: 30,
                  getTitlesWidget: (value, meta) {
                    return Text('${value.toInt()}');
                  },
                ),
              ),
            ),
            gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              horizontalInterval: 500000,
              verticalInterval: 30,
            ),
            borderData: FlBorderData(show: true),
          ),
        ),
      ),
    );
  }
}
