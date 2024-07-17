import 'package:bankingapp/core/presentation/bloc/beneficios/beneficio_event.dart'; 
import 'package:bankingapp/core/presentation/bloc/beneficios/beneficio_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_beneficio_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';


class BeneficioBloc extends Bloc<BeneficioEvent, BeneficioState> {
  final usecase.LoadBeneficioData loadBeneficioData;

  BeneficioBloc(this.loadBeneficioData) : super(const BeneficioState()) {
    on<LoadBeneficioDataEvent>((event, emit) async {
      final beneficioData = await loadBeneficioData();
      emit(BeneficioState.fromModel(beneficioData));
    });

    on<PicChanged>((event, emit) {
      emit(state.copyWith(beneficio_pic: event.beneficio_pic, isValid: _validateForm()));
    });
    on<NombreBChanged>((event, emit) {
      emit(state.copyWith(nombre_beneficio: event.nombre_beneficio, isValid: _validateForm()));
    });
    on<TipoBChanged>((event, emit) {
      emit(state.copyWith(tipo_beneficio: event.tipo_beneficio, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return state.beneficio_pic.isNotEmpty &&
        state.nombre_beneficio.isNotEmpty &&
        state.tipo_beneficio.isNotEmpty;
  }
}
