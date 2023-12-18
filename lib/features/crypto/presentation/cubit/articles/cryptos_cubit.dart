import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../cryptos.dart';

class CryptosCubit extends Cubit<CryptosState> {
  final GetCryptosUseCase _getCryptosUseCase;

  CryptosCubit({required GetCryptosUseCase getCryptosUseCase})
      : _getCryptosUseCase = getCryptosUseCase,
        super(CryptosState.initial()) {
    getCryptosCubit();
  }

  Future<void> getCryptosCubit() async {
    emit(state.copyWith(status: CryptosStateStatus.loading));
    try {
      final cryptos = await _getCryptosUseCase();
      emit(state.copyWith(status: CryptosStateStatus.loaded, cryptos: cryptos));
    } on ServerFailure catch (e) {
      emit(state.copyWith(
          status: CryptosStateStatus.error,
          failure: ServerFailure(errorMessage: e.errorMessage)));
    } catch (e) {
      emit(state.copyWith(
          status: CryptosStateStatus.error,
          failure: ServerFailure(errorMessage: 'Unexpected error')));
    }
  }
}
