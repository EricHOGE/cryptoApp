import 'package:crypto/features/chart/domain/entities/chart_entity.dart';

abstract class ChartRepository {
  Future<List<ChartEntity>> getChartCrypto(String cryptoId);
}
