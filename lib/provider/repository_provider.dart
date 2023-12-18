import '../features/chart/data/repositories/chart_repository_impl.dart';
import '../features/chart/domain/repositories/chart_repository.dart';
import '../features/crypto/data/repositories/cryptos_repository_impl.dart';
import '../features/crypto/domain/repositories/cryptos_repository.dart';
import 'data_source_provider.dart';

class BaseRepositoryProvider {
  static final CryptosRepository cryptosRepoProvider = CryptosRepositoryImpl(
    cryptosRemoteDataSource: DataSourceProvider.cryptosDataSourceProvider,
  );
  static final ChartRepository chartRepoProvider = ChartRepositoryImpl(
    chartRemoteDataSource: DataSourceProvider.chartDataSourceProvider,
  );
}
