import 'package:equatable/equatable.dart';

class ChartEntity extends Equatable {
  final DateTime date;
  final double price;

  const ChartEntity({required this.date, required this.price});

  @override
  List<Object?> get props => [date, price];
}
