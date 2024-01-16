import 'package:crypto_app/features/crypto/domain/repositories/cryptos_repository.dart';

import '../entities/crypto_entity.dart';

class GetCryptosUseCase {
  final CryptosRepository repository;

  GetCryptosUseCase(this.repository);

  Future<List<CryptoEntity>> call() async {
    return await repository.getCryptos();
  }
}
