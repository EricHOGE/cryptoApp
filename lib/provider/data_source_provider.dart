import 'package:crypto/features/chart/data/datasources/chart_remote_data_source.dart';
import 'package:crypto/features/crypto/data/datasources/cryptos_remote_data_source_impl.dart';
import 'package:dio/dio.dart';

import '../features/chart/data/datasources/chart_remote_data_source_impl.dart';
import '../features/crypto/data/datasources/cryptos_remote_data_source.dart';

class DataSourceProvider {
  static final CryptosRemoteDataSource cryptosDataSourceProvider =
      CryptosRemoteDataSourceImpl(
    dio: Dio(),
  );
  static final ChartRemoteDataSource chartDataSourceProvider =
      ChartRemoteDataSourceImpl(
    dio: Dio(),
  );
}
