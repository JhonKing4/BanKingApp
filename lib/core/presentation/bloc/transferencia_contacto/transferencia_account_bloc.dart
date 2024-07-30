import 'package:bankingapp/core/presentation/bloc/registro/usuarios_event.dart' as usecase;
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferenciaAmountBloc extends Bloc<TransferenciaAmountEvent, TransferenciaAmountState> {
  final usecase.SubmitRegisterTransfer submitContact;

  TransferenciaAmountBloc(this.submitContact) : super(TrasferenciaInitial()) {
    on<SubmitRegisterTransferEvent>((event, emit) async {
      emit(TrasferenciaLoading());
      try {
        await submitContact(event.register);
        emit(TrasferenciaSuccess());
      } catch (e) {
        emit(TrasferenciaError('Error al hacer la transferencia'));
      }
    });
  }
}
