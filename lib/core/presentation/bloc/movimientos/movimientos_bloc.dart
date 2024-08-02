import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'movimientos_event.dart';
import 'movimientos_state.dart';


class MovimientosBloc extends Bloc<MovimientosEvent, MovimientosState> {
  final usecase.LoadMovimientosData  loadTransferenciaData;

  MovimientosBloc(this.loadTransferenciaData) : super(const MovimientosState()) {
    on<LoadMovimientosDataEvent>((event, emit) async {
      try {
        final transferenciaData = await loadTransferenciaData();
        emit(MovimientosState.fromModel(transferenciaData));
      } catch (error) {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isValid: false,
        ));
      }
    });

    on<SenderIdChanged>((event, emit) {
      final updatedMovimientos = state.movimientos.map((transferencia) {
        if (transferencia.id_sender == event.idSender) {
          return transferencia.copyWith(id_sender: event.idSender);
        }
        return transferencia;
      }).toList();
      emit(state.copyWith(movimientos: updatedMovimientos));
    });

    on<ReceptorIdChanged>((event, emit) {
      final updatedMovimientos = state.movimientos.map((transferencia) {
        if (transferencia.id_receptor == event.idReceptor) {
          return transferencia.copyWith(id_receptor: event.idReceptor);
        }
        return transferencia;
      }).toList();
      emit(state.copyWith(movimientos: updatedMovimientos));
    });

    on<UserAccountChanged>((event, emit) {
      final updatedMovimientos = state.movimientos.map((transferencia) {
        if (transferencia.user_account == event.userAccount) {
          return transferencia.copyWith(user_account: event.userAccount);
        }
        return transferencia;
      }).toList();
      emit(state.copyWith(movimientos: updatedMovimientos));
    });

    on<ReceptorAccountChanged>((event, emit) {
      final updatedMovimientos = state.movimientos.map((transferencia) {
        if (transferencia.receptor_account == event.receptorAccount) {
          return transferencia.copyWith(receptor_account: event.receptorAccount);
        }
        return transferencia;
      }).toList();
      emit(state.copyWith(movimientos: updatedMovimientos));
    });

    on<AmountChanged>((event, emit) {
      final updatedMovimientos = state.movimientos.map((transferencia) {
        if (transferencia.amount == event.amount) {
          return transferencia.copyWith(amount: event.amount);
        }
        return transferencia;
      }).toList();
      emit(state.copyWith(movimientos: updatedMovimientos));
    });
  }
}