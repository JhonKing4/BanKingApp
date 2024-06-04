

import 'package:bankingapp/core/presentation/bloc/transferencia2_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia2_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia2_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class Transferencia2Bloc extends Bloc<Transferencia2Event, Transferencia2State> {
  final usecase.LoadTransferencia2Data loadTransferencia2Data;

  Transferencia2Bloc(this.loadTransferencia2Data) : super(Transferencia2State()) {
    on<LoadTransferencia2DataEvent>((event, emit) async {
      final transferencia2Data = await loadTransferencia2Data();
      emit(Transferencia2State.fromModel(transferencia2Data));
    });

    on<ContactoChanged>((event, emit) {
      emit(state.copyWith(contacto_pic: event.contacto_pic, isValid: _validateForm()));
    });
    on<NombreCChanged>((event, emit) {
      emit(state.copyWith(nombre_contacto: event.nombre_contacto, isValid: _validateForm()));
    });
     on<NumeroTCChanged>((event, emit) {
      emit(state.copyWith(numero_tarjeta_contacto: event.numero_tarjeta_contacto, isValid: _validateForm()));
    });
     on<TarjetaPicChanged>((event, emit) {
      emit(state.copyWith(tarjeta_pic: event.tarjeta_pic, isValid: _validateForm()));
    });
     on<SaldoTChanged>((event, emit) {
      emit(state.copyWith(saldo_tarjeta: event.saldo_tarjeta, isValid: _validateForm()));
    });
     on<NumeroTarChanged>((event, emit) {
      emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return state.tarjeta_pic.isEmpty &&
        state.contacto_pic != Null &&
        state.saldo_tarjeta != Null &&
        state.numero_tarjeta.isEmpty &&
        state.nombre_contacto.isNotEmpty;
  }
}