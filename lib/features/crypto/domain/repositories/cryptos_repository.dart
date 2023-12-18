import 'package:crypto/features/crypto/domain/entities/crypto_entity.dart';

abstract class CryptosRepository {
  Future<List<CryptoEntity>> getCryptos();
}
