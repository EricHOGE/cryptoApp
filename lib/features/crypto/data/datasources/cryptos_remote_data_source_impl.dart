import 'package:crypto_app/features/crypto/data/models/cryptos_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'cryptos_remote_data_source.dart';

class CryptosRemoteDataSourceImpl implements CryptosRemoteDataSource {
  final Dio dio;

  CryptosRemoteDataSourceImpl({required this.dio});

  @override
  Future<CryptosResponseModel> getCryptos() async {
    String url = dotenv.env['CRYPTOURL'] as String;

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200 && response.data != null) {
        print('response data : ${response.data}');
        return CryptosResponseModel.fromJson(response.data as List<dynamic>);
      } else {
        throw Exception('Failed to load cryptos');
      }
    } on DioException catch (e) {
      // Gestion des erreurs spécifiques à Dio
      throw Exception('Failed to load cryptos: ${e.message}');
    } catch (e) {
      // Autres erreurs
      throw Exception('Unexpected error: ${e.toString()}');
    }
  }
}
