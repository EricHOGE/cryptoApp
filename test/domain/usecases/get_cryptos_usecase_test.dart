import 'package:crypto_app/features/crypto/cryptos.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cryptos_usecase_test.mocks.dart';

@GenerateMocks([CryptosRepository])
void main() {
  late GetCryptosUseCase getCryptosUseCase;
  late MockCryptosRepository mockCryptosRepository;

  setUp(() {
    mockCryptosRepository = MockCryptosRepository();
    getCryptosUseCase = GetCryptosUseCase(mockCryptosRepository);
  });

  final List<CryptoEntity> tCryptosList = [];

  test(
    'should get cryptos from the repository',
    () async {
      // arrange
      when(mockCryptosRepository.getCryptos())
          .thenAnswer((_) async => tCryptosList);
      // act
      final result = await getCryptosUseCase.call();
      // assert
      expect(result, tCryptosList);
      verify(mockCryptosRepository.getCryptos());
      verifyNoMoreInteractions(mockCryptosRepository);
    },
  );
}
