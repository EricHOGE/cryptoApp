import 'package:crypto_app/features/crypto/data/models/crypto_model.dart';
import 'package:equatable/equatable.dart';

class CryptosResponseModel extends Equatable {
  final List<CryptoModel> cryptos;

  const CryptosResponseModel({required this.cryptos});

  @override
  List<Object?> get props => [cryptos];

  factory CryptosResponseModel.fromJson(List<dynamic> jsonList) {
    return CryptosResponseModel(
      cryptos: jsonList.map((json) => CryptoModel.fromJson(json)).toList(),
    );
  }
}
