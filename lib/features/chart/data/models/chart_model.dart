import 'package:crypto_app/features/chart/domain/entities/chart_entity.dart';
import 'package:equatable/equatable.dart';

class ChartModel extends Equatable {
  final DateTime date;
  final double price;

  const ChartModel({required this.date, required this.price});

  @override
  List<Object?> get props => [date, price];

  factory ChartModel.fromJson(List<dynamic> json) {
    return ChartModel(
      date: DateTime.fromMillisecondsSinceEpoch(json[0]),
      price: json[1].toDouble(),
    );
  }

  ChartEntity toDomain() {
    return ChartEntity(
      date: date,
      price: price,
    );
  }
}
