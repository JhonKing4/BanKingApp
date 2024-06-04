
import 'package:bankingapp/core/presentation/bloc/tarjetas_event.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_tarjetas_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class TarjetasBloc extends Bloc<TarjetasEvent, TarjetasState> {
  final usecase.LoadTarjetasData loadTarjetasData;

  TarjetasBloc(this.loadTarjetasData) : super(const TarjetasState()) {
    on<LoadTarjetasDataEvent>((event, emit) async {
      final tarjetasData = await loadTarjetasData();
      emit(TarjetasState.fromModel(tarjetasData));
    });

    on<TarjetaPChanged>((event, emit) {
      emit(state.copyWith(tarjeta_pic: event.tarjeta_pic, isValid: _validateForm()));
    });
    on<SaldoChanged>((event, emit) {
      emit(state.copyWith(saldo_tarjeta: event.saldo_tarjeta, isValid: _validateForm()));
    });
    on<NumeroTChanged>((event, emit) {
      emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return state.tarjeta_pic.isNotEmpty &&
        state.saldo_tarjeta != Null &&
        state.numero_tarjeta.isNotEmpty;
  }
}