import 'chart_model.dart';

class ChartResponseModel {
  final List<ChartModel> prices;
  final List<ChartModel> marketCaps;
  final List<ChartModel> totalVolumes;

  const ChartResponseModel(
      {required this.prices,
      required this.marketCaps,
      required this.totalVolumes});

  factory ChartResponseModel.fromJson(Map<String, dynamic> json) {
    return ChartResponseModel(
      prices: List<ChartModel>.from(
          json['prices'].map((x) => ChartModel.fromJson(x))),
      marketCaps: List<ChartModel>.from(
          json['market_caps'].map((x) => ChartModel.fromJson(x))),
      totalVolumes: List<ChartModel>.from(
          json['total_volumes'].map((x) => ChartModel.fromJson(x))),
    );
  }
}
