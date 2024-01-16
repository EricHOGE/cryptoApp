import 'package:crypto_app/features/crypto/data/datasources/cryptos_remote_data_source_impl.dart';
import 'package:crypto_app/features/crypto/data/models/cryptos_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'crypto_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late CryptosRemoteDataSourceImpl dataSource;
  late MockDio mockDio;

  setUpAll(() async {
    await dotenv.load();
    mockDio = MockDio();
    dataSource = CryptosRemoteDataSourceImpl(dio: mockDio);
  });

  const tCryptosResponseModel = CryptosResponseModel(cryptos: []);

  test(
    'should return CryptosResponseModel when the response code is 200',
    () async {
      // arrange
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: [],
          statusCode: 200,
        ),
      );
      // act
      final result = await dataSource.getCryptos();
      // assert
      expect(result, equals(tCryptosResponseModel));
    },
  );

  test(
    'should throw an Exception when the response code is not 200',
    () async {
      // arrange
      when(mockDio.get(any, options: anyNamed('options'))).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: ''),
          data: 'Something went wrong',
          statusCode: 404,
        ),
      );
      // act
      final call = dataSource.getCryptos;
      // assert
      expect(() => call(), throwsException);
    },
  );
}
