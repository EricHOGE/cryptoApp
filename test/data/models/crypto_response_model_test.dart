import 'package:crypto_app/features/crypto/data/models/crypto_model.dart';
import 'package:crypto_app/features/crypto/data/models/cryptos_response_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // arrange
  const tCryptoModel = CryptoModel(
    id: '1',
    name: 'Bitcoin',
    symbol: 'BTC',
    image: 'https://image.url',
    price: 60000,
    change: 0.01,
  );

  const tCryptosResponseModel1 = CryptosResponseModel(cryptos: [tCryptoModel]);

  const tCryptosResponseModel2 = CryptosResponseModel(cryptos: [tCryptoModel]);

  final tJsonList = [
    {
      'id': '1',
      'name': 'Bitcoin',
      'symbol': 'BTC',
      'image': 'https://image.url',
      'current_price': 60000,
      'price_change_percentage_24h': 0.01,
    },
  ];

  test(
    'should be a subclass of Equatable entity',
    () async {
      // assert
      expect(tCryptosResponseModel1, isA<Equatable>());
    },
  );

  test(
    'should return true when comparing the same instances',
    () async {
      // assert
      expect(tCryptosResponseModel1, tCryptosResponseModel2);
    },
  );

  test(
    'should return a valid model when the JSON list is provided',
    () async {
      // act
      final result = CryptosResponseModel.fromJson(tJsonList);
      // assert
      expect(result, tCryptosResponseModel1);
    },
  );
}
