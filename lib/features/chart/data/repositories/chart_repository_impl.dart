import '../../domain/entities/chart_entity.dart';
import '../../domain/repositories/chart_repository.dart';
import '../datasources/chart_remote_data_source.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartRemoteDataSource chartRemoteDataSource;

  ChartRepositoryImpl({
    required this.chartRemoteDataSource,
  });

  @override
  Future<List<ChartEntity>> getChartCrypto(String cryptoId) async {
    try {
      final response =
          await chartRemoteDataSource.getChartData(cryptoId: cryptoId);
      return response.prices.map((price) => price.toDomain()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
