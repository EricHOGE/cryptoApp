import 'package:crypto/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/chart_entity.dart';

enum ChartStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ChartState extends Equatable {
  final ChartStateStatus status;
  final List<ChartEntity> prices;
  final Failure? failure;

  const ChartState({
    required this.status,
    required this.prices,
    this.failure,
  });

  @override
  List<Object> get props => [status, prices];

  ChartState copyWith({
    ChartStateStatus? status,
    List<ChartEntity>? prices,
    Failure? failure,
  }) {
    return ChartState(
      status: status ?? this.status,
      prices: prices ?? this.prices,
      failure: failure ?? this.failure,
    );
  }

  factory ChartState.initial() {
    return const ChartState(
      status: ChartStateStatus.initial,
      prices: [],
    );
  }
}
