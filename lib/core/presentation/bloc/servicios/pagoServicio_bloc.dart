
import 'package:bankingapp/core/presentation/bloc/servicios/pagoServicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/pagoServicio_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_pagoservicio_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class PagoServicioBloc extends Bloc<PagoServicioEvent, PagoServicioState> {
  final usecase.SubmitPago submitPago;

  PagoServicioBloc(this.submitPago) : super(PagoServicioInitial()) {
    on<BotonPagoServicioEvent>((event, emit) async {
      emit(PagoServicioLoading());
      try {
        await submitPago(event.pago);
        emit(PagoServicioSuccess());
      } catch (e) {
        emit(PagoServicioError('Error al enviar el formualrio'));
      }
    });
  }
}