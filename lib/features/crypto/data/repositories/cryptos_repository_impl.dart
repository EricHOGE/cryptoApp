import 'package:crypto_app/features/crypto/domain/entities/crypto_entity.dart';

import '../../domain/repositories/cryptos_repository.dart';
import '../datasources/cryptos_remote_data_source.dart';

class CryptosRepositoryImpl implements CryptosRepository {
  final CryptosRemoteDataSource cryptosRemoteDataSource;

  CryptosRepositoryImpl({required this.cryptosRemoteDataSource});

  @override
  Future<List<CryptoEntity>> getCryptos() async {
    try {
      final response = await cryptosRemoteDataSource.getCryptos();

      // Conversion des articles en entités de domaine et renvoi d'un Right
      return response.cryptos.map((crypto) => crypto.toDomain()).toList();
    } catch (e) {
      throw Exception('Failed to load article: ${e.toString()}');
    }
  }
}
