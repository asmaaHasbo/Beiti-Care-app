import 'package:beiti_care/view/asmaa_response/cubit/response_cubit.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChartPatientWidget extends StatelessWidget {
  const ChartPatientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResponseCubit, ResponseState>(
      builder: (context, state) {
        return Container(
            padding: EdgeInsets.only(left: 10, right: 45, top: 20, bottom: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            height: 176,
            width: 400,
            child: (state is CompareingFilesLoadingState)
                ? const Center(child: CircularProgressIndicator())
                : LineChart(
                    LineChartData(
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10, // ← show every 10
                            getTitlesWidget: (value, meta) {
                              if (value != 0) {
                                return Text(
                                  value.toInt().toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF49768C)),
                                );
                              } else {
                                return SizedBox(
                                  height: 0,
                                );
                              }
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 0:
                                  return Text('Sept 3',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF49768C)));
                                case 1:
                                  return Text('Sept 4',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF49768C)));
                                case 2:
                                  return Text('Sept 5',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF49768C)));
                                case 3:
                                  return Text('Sept 6',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF49768C)));
                              }

                              return const SizedBox(
                                height: 0,
                              );
                            },
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: false),
                      minX: 0,
                      maxX: 3,
                      minY: 0,
                      maxY: 40,
                      lineBarsData: [
                        LineChartBarData(
                            isCurved: false,
                            color: Color(0xFF49768C),
                            barWidth: 2,
                            dotData: FlDotData(show: false),
                            spots: [
                              FlSpot(0, 20), // بداية مستقيم
                              FlSpot(0.5, 20),
                              FlSpot(0.7, 35), // طلعة
                              FlSpot(1.0, 10), // نزلة
                              FlSpot(1.3, 25), // طلعة صغيرة
                              FlSpot(1.6, 15), // نزلة بسيطة
                              FlSpot(2.0, 20), // استقرار
                              FlSpot(2.5, 20), // استمرار
                              FlSpot(2.7, 30), // طلعة خفيفة
                              FlSpot(3.0, 20), // رجوع للنقطة
                            ])
                      ],
                    ),
                  ));
      },
    );
  }
}
