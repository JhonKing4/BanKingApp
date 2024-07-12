import 'package:bankingapp/core/presentation/bloc/transferencia/transferencia_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia/transferencia_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferenciaBloc extends Bloc<TransferenciaEvent, TransferenciaState> {
  final usecase.LoadTransferenciaData loadtransferenciaData;

  TransferenciaBloc(this.loadtransferenciaData) : super(const TransferenciaState()) {
    on<LoadTransferenciaDataEvent>((event, emit) async {
      try {
        final servicioData = await loadtransferenciaData();
        emit(TransferenciaState.fromModel(servicioData));
      } catch (error) {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isValid: false,
        ));
      }
    });
  }
}
