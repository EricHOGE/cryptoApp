import 'package:crypto_app/features/crypto/data/models/cryptos_response_model.dart';

abstract class CryptosRemoteDataSource {
  Future<CryptosResponseModel> getCryptos();
}
