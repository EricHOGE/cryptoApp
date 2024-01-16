import 'package:crypto_app/features/chart/domain/entities/chart_entity.dart';

abstract class ChartRepository {
  Future<List<ChartEntity>> getChartCrypto(String cryptoId);
}
