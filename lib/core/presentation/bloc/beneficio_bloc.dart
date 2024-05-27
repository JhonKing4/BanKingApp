// import 'package:bankingapp/core/presentation/bloc/beneficio_event.dart'; 
// import 'package:bankingapp/core/presentation/bloc/beneficio_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BeneficioBloc extends Bloc<BeneficioEvent, BeneficioState> {
//   final usecase.LoadFormData loadFormData;

//   BeneficioBloc(this.loadFormData) : super(const BeneficioState()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(BeneficioState.fromModel(formData));
//     });

//     on<PicChanged>((event, emit) {
//       emit(state.copyWith(beneficio_pic: event.beneficio_pic, isValid: _validateForm()));
//     });
//     on<NombreBChanged>((event, emit) {
//       emit(state.copyWith(nombre_beneficio: event.nombre_beneficio, isValid: _validateForm()));
//     });
//     on<TipoBChanged>((event, emit) {
//       emit(state.copyWith(tipo_beneficio: event.tipo_beneficio, isValid: _validateForm()));
//     });
//   }

//   bool _validateForm() {
//     return state.beneficio_pic.isNotEmpty &&
//         state.nombre_beneficio.isNotEmpty &&
//         state.tipo_beneficio.isNotEmpty;
//   }
// }
