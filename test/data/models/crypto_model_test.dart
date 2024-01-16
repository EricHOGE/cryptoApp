import 'package:crypto_app/features/crypto/data/models/crypto_model.dart';
import 'package:crypto_app/features/crypto/domain/entities/crypto_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // arrange
  const tCryptoModel1 = CryptoModel(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

  const tCryptoModel2 = CryptoModel(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

  const tCryptoEntity = CryptoEntity(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

// arrange
  final tJson = {
    'id': '1',
    'name': 'Bitcoin',
    'symbol': 'BTC',
    'image': 'https://image.url',
    'current_price': 60000,
    'price_change_percentage_24h': 0.01,
  };

  test(
    'should be a subclass of Equatable entity',
    () async {
      // assert
      expect(tCryptoModel1, isA<Equatable>());
    },
  );

  test(
    'should return true when comparing the same instances',
    () async {
      // assert
      expect(tCryptoModel1, tCryptoModel2);
    },
  );

  test(
    'should return a valid model when the JSON is provided',
    () async {
      // act
      final result = CryptoModel.fromJson(tJson);
      // assert
      expect(result, tCryptoModel1);
    },
  );

  test(
    'should return a valid entity when the model is converted',
    () async {
      // act
      final result = tCryptoModel1.toDomain();
      // assert
      expect(result, tCryptoEntity);
    },
  );
}
