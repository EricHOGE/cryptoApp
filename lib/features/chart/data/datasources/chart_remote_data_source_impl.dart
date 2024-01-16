import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/chart_response_model.dart';
import 'chart_remote_data_source.dart';

class ChartRemoteDataSourceImpl implements ChartRemoteDataSource {
  final Dio dio;

  ChartRemoteDataSourceImpl({required this.dio});

  @override
  Future<ChartResponseModel> getChartData({required String cryptoId}) async {
    String baseUrl = dotenv.env['BASECHARTURL'] as String;

    Map<String, dynamic> queryParams = {
      'vs_currency': 'usd',
      'days': '30',
      'interval': 'daily'
    };
    try {
      String url = '$baseUrl/$cryptoId/market_chart';
      final response = await dio.get(url, queryParameters: queryParams);
      print('ChartRemoteDataSourceImpl: response: ${response.data}');
      return ChartResponseModel.fromJson(response.data);
    } on DioException {
      throw ServerException();
    }
  }
}
