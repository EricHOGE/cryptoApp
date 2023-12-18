import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../domain/entities/chart_entity.dart';
import '../cubit/chart_cubit.dart';
import '../cubit/chart_state.dart';

class ChartView extends StatefulWidget {
  const ChartView({
    super.key,
    required this.cryptoID,
    required this.cryptoChange,
  });
  final String cryptoID;
  final num cryptoChange;

  @override
  State<ChartView> createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  void initState() {
    super.initState();
    context.read<ChartCubit>().getChartCubit(widget.cryptoID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartCubit, ChartState>(
      builder: (context, state) {
        if (state.status == ChartStateStatus.loaded) {
          final List<ChartEntity> data = state.prices;
          bool hasValuesBelowOne = data.any((chartData) => chartData.price < 1);

          NumberFormat yAxisFormat = hasValuesBelowOne
              ? NumberFormat.simpleCurrency(decimalDigits: 2)
              : NumberFormat.simpleCurrency(decimalDigits: 0);

          return SizedBox(
            height: 250,
            child: SfCartesianChart(
              primaryXAxis: DateTimeCategoryAxis(
                axisLine: AxisLine(
                  color: Colors.grey.shade700,
                  width: 1,
                ),
                dateFormat: DateFormat('dd MMM'),
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                majorGridLines: MajorGridLines(
                  color: Colors.grey.shade700,
                ),
                interval: 7,
              ),
              primaryYAxis: NumericAxis(
                axisLine: AxisLine(
                  color: Colors.grey.shade700,
                  width: 1,
                ),
                majorGridLines: MajorGridLines(
                  color: Colors.grey.shade700,
                ),
                numberFormat: yAxisFormat,
                labelStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                rangePadding: ChartRangePadding.round,
              ),
              legend: const Legend(isVisible: false),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CartesianSeries<ChartEntity, DateTime>>[
                LineSeries<ChartEntity, DateTime>(
                  dataSource: data,
                  xValueMapper: (ChartEntity sales, _) => sales.date,
                  yValueMapper: (ChartEntity sales, _) => sales.price,
                  name: 'Sales',
                  color: widget.cryptoChange > 0
                      ? const Color.fromARGB(255, 73, 199, 79)
                      : const Color.fromARGB(255, 255, 0, 0),
                  dataLabelSettings: const DataLabelSettings(isVisible: false),
                ),
              ],
            ),
          );
        } else if (state.status == ChartStateStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('Erreur de chargement des données'));
        }
      },
    );
  }
}
