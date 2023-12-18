import 'package:crypto/features/crypto/domain/entities/crypto_entity.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';

enum CryptosStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class CryptosState extends Equatable {
  final CryptosStateStatus status;
  final List<CryptoEntity> cryptos;
  final Failure? failure;

  const CryptosState({
    required this.status,
    required this.cryptos,
    this.failure,
  });

  @override
  List<Object?> get props => [status, cryptos, failure];

  CryptosState copyWith({
    CryptosStateStatus? status,
    List<CryptoEntity>? cryptos,
    Failure? failure,
  }) {
    return CryptosState(
      status: status ?? this.status,
      cryptos: cryptos ?? this.cryptos,
      failure: failure ?? this.failure,
    );
  }

  factory CryptosState.initial() {
    return const CryptosState(
      status: CryptosStateStatus.initial,
      cryptos: [],
    );
  }
}
