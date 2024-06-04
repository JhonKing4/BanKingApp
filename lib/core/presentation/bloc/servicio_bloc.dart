
import 'package:bankingapp/core/presentation/bloc/servicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart' as usecase;

import 'package:flutter_bloc/flutter_bloc.dart';

class ServicioBloc extends Bloc<ServicioEvent, ServicioState> {
  final usecase.LoadServicioData loadServicioData;

  ServicioBloc(this.loadServicioData) : super(const ServicioState()) {
    on<LoadServicioDataEvent>((event, emit) async {
      final servicioData = await loadServicioData();
      emit(ServicioState.fromModel(servicioData));
    });

    on<ServicioPChanged>((event, emit) {
      emit(state.copyWith(servicio_pic: event.servicio_pic, isValid: _validateForm()));
    });
    on<NombreSChanged>((event, emit) {
      emit(state.copyWith(nombre_servicio: event.nombre_servicio, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return state.servicio_pic.isNotEmpty &&
        state.nombre_servicio.isNotEmpty;
  }
}
