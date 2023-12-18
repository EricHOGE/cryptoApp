import 'package:bloc/bloc.dart';
import 'package:crypto/features/chart/domain/usecases/get_chart_usecase.dart';
import 'package:crypto/features/chart/presentation/cubit/chart_state.dart';

import '../../../../core/errors/failure.dart';

class ChartCubit extends Cubit<ChartState> {
  final GetChartUsecase _getChartUsecase;

  ChartCubit({required GetChartUsecase getChartUsecase})
      : _getChartUsecase = getChartUsecase,
        super(ChartState.initial());

  Future<void> getChartCubit(String cryptoId) async {
    print('ChartCubit: Starting to load chart data for $cryptoId');
    emit(state.copyWith(status: ChartStateStatus.loading));
    try {
      final prices = await _getChartUsecase(cryptoId);
      print('ChartCubit: Successfully loaded data: $prices');
      emit(state.copyWith(status: ChartStateStatus.loaded, prices: prices));
    } on ServerFailure catch (e) {
      print('ChartCubit: Server Failure - ${e.errorMessage}');
      emit(state.copyWith(
          status: ChartStateStatus.error,
          failure: ServerFailure(errorMessage: e.errorMessage)));
    } catch (e) {
      print('ChartCubit: Unexpected Error - ${e.toString()}');
      emit(state.copyWith(
          status: ChartStateStatus.error,
          failure: ServerFailure(
              errorMessage: 'Unexpected error: ${e.toString()}')));
    }
  }
}
