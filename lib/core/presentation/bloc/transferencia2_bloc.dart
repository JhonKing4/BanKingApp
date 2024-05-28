

// import 'package:bankingapp/core/presentation/bloc/transferencia2_event.dart';
// import 'package:bankingapp/core/presentation/bloc/transferencia2_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Transferencia2Bloc extends Bloc<Transferencia2Event, Transferencia2State> {
//   final usecase.LoadFormData loadFormData;

//   Transferencia2Bloc(this.loadFormData) : super(Transferencia2State()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(Transferencia2State.fromModel(formData));
//     });

//     on<ContactoChanged>((event, emit) {
//       emit(state.copyWith(contacto_pic: event.contacto_pic, isValid: _validateForm()));
//     });
//     on<NombreCChanged>((event, emit) {
//       emit(state.copyWith(nombre_contacto: event.nombre_contacto, isValid: _validateForm()));
//     });
//      on<NumeroTCChanged>((event, emit) {
//       emit(state.copyWith(numero_tarjeta_contacto: event.numero_tarjeta_contacto, isValid: _validateForm()));
//     });
//      on<TarjetaPicChanged>((event, emit) {
//       emit(state.copyWith(tarjeta_pic: event.tarjeta_pic, isValid: _validateForm()));
//     });
//      on<SaldoTChanged>((event, emit) {
//       emit(state.copyWith(saldo_tarjeta: event.saldo_tarjeta, isValid: _validateForm()));
//     });
//      on<NumeroTarChanged>((event, emit) {
//       emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
//     });
//   }

//   bool _validateForm() {
//     return state.balance != Null &&
//         state.contacto_pic != Null &&
//         state.nombre_contacto.isNotEmpty;
//   }
// }