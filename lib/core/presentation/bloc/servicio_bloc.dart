import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart' as usecase;

class ServicioBloc extends Bloc<ServicioEvent, ServicioState> {
  final usecase.LoadServicioData loadServicioData;

  ServicioBloc(this.loadServicioData) : super(const ServicioState()) {
    on<LoadServicioDataEvent>((event, emit) async {
      try {
        final servicioData = await loadServicioData();
        emit(ServicioState.fromModel(servicioData));
      } catch (error) {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isValid: false,
        ));
      }
    });
  }
}
