import 'package:crypto_app/features/chart/domain/entities/chart_entity.dart';

import '../repositories/chart_repository.dart';

class GetChartUsecase {
  final ChartRepository _chartRepository;

  GetChartUsecase(this._chartRepository);

  Future<List<ChartEntity>> call(String cryptoId) async {
    return await _chartRepository.getChartCrypto(cryptoId);
  }
}
