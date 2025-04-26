// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:dio/dio.dart';

// class GrafikPage extends StatefulWidget {
//   @override
//   _GrafikPageState createState() => _GrafikPageState();
// }

// class _GrafikPageState extends State<GrafikPage> {
//   List<FlSpot> points = [];
//   bool isLoading = true;
//   String? errorMessage;

//   final Dio dio = Dio();

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       final response = await dio.get('http://192.168.x.x:8000/grafik'); // Replace with your IP
//       print(response.data); // Debug the response

//       if (response.statusCode == 200) {
//         final List<dynamic> data = response.data;

//         if (data.isEmpty) {
//           setState(() {
//             errorMessage = 'No data available';
//             isLoading = false;
//           });
//           return;
//         }

//         setState(() {
//           points = data.asMap().entries.map((entry) {
//             int index = entry.key;
//             var item = entry.value;
//             return FlSpot(index.toDouble(), item['price'].toDouble());
//           }).toList();
//           isLoading = false;
//         });
//       } else {
//         setState(() {
//           errorMessage = 'Failed to load data: ${response.statusCode}';
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error: $e'); // Debug the error
//       setState(() {
//         errorMessage = 'An error occurred: $e';
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Grafik Harga')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : errorMessage != null
//                 ? Center(
//                     child: Text(
//                       errorMessage!,
//                       style: TextStyle(color: Colors.red),
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                 : points.isEmpty
//                     ? Center(
//                         child: Text(
//                           'No data available',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       )
//                     : LineChart(
//                         LineChartData(
//                           lineBarsData: [
//                             LineChartBarData(
//                               spots: points,
//                               isCurved: true,
//                               colors: [Colors.green],
//                               belowBarData: BarAreaData(show: false),
//                             )
//                           ],
//                         ),
//                       ),
//       ),
//     );
//   }
// }