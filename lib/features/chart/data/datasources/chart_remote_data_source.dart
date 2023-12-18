import '../models/chart_response_model.dart';

abstract class ChartRemoteDataSource {
  Future<ChartResponseModel> getChartData({required String cryptoId});
}
