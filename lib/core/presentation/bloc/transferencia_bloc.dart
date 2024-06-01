
import 'package:bankingapp/core/presentation/bloc/transferencia_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferenciaBloc extends Bloc<TransferenciaEvent, TransferenciaState> {
  final usecase.LoadTransferenciaData loadTransferenciaData;

  TransferenciaBloc(this.loadTransferenciaData) : super(TransferenciaState()) {
    on<LoadTransferenciaDataEvent>((event, emit) async {
      final transferenciaData = await loadTransferenciaData();
      emit(TransferenciaState.fromModel(transferenciaData));
    });

    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(balance: event.balance, isValid: _validateForm()));
    });
    on<ContactoChanged>((event, emit) {
      emit(state.copyWith(contacto_pic: event.contacto_pic, isValid: _validateForm()));
    });
    on<NombreCChanged>((event, emit) {
      emit(state.copyWith(nombre_contacto: event.nombre_contacto, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return state.balance != Null &&
        state.contacto_pic != Null &&
        state.nombre_contacto.isNotEmpty;
  }
}