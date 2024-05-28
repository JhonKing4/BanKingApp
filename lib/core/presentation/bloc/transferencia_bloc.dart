
// import 'package:bankingapp/core/presentation/bloc/transferencia_event.dart';
// import 'package:bankingapp/core/presentation/bloc/transferencia_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TransferenciaBloc extends Bloc<TransferenciaEvent, TransferenciaState> {
//   final usecase.LoadFormData loadFormData;

//   TransferenciaBloc(this.loadFormData) : super(TransferenciaState()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(TransferenciaState.fromModel(formData));
//     });

//     on<BalanceChanged>((event, emit) {
//       emit(state.copyWith(balance: event.balance, isValid: _validateForm()));
//     });
//     on<ContactoChanged>((event, emit) {
//       emit(state.copyWith(contacto_pic: event.contacto_pic, isValid: _validateForm()));
//     });
//     on<NombreCChanged>((event, emit) {
//       emit(state.copyWith(nombre_contacto: event.nombre_contacto, isValid: _validateForm()));
//     });
//   }

//   bool _validateForm() {
//     return state.balance != Null &&
//         state.contacto_pic != Null &&
//         state.nombre_contacto.isNotEmpty;
//   }
// }