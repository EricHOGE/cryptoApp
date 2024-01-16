import 'package:crypto_app/features/crypto/domain/entities/crypto_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Arrange
  const tCryptoEntity1 = CryptoEntity(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

  const tCryptoEntity2 = CryptoEntity(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

  test(
    'should be a subclass of Equatable entity',
    () async {
      // assert
      expect(tCryptoEntity1, isA<Equatable>());
    },
  );

  test(
    'should return true when comparing the same instances',
    () async {
      // assert
      expect(tCryptoEntity1, tCryptoEntity2);
    },
  );
}
