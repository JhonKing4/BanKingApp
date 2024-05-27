

// import 'package:bankingapp/core/presentation/bloc/retiro_event.dart';
// import 'package:bankingapp/core/presentation/bloc/retiro_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class RetiroBloc extends Bloc<RetiroEvent, RetiroState> {
//   final usecase.LoadFormData loadFormData;

//   RetiroBloc(this.loadFormData) : super(const RetiroState()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(RetiroBloc.fromModel(formData));
//     });

//     on<TarjetaPChanged>((event, emit) {
//       emit(state.copyWith(numero_tarjeta: event.tarjeta_pic, isValid: _validateForm()));
//     });
//     on<BalanceTChanged>((event, emit) {
//       emit(state.copyWith(balance_tajeta: event.balance_tajeta, isValid: _validateForm()));
//     });
//     on<NumeroTChanged>((event, emit) {
//       emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
//     });
//   }

//   bool _validateForm() {
//     return state.tarjeta_pic.isNotEmpty &&
//         state.balance_tajeta != null &&
//         state.numero_tarjeta.isNotEmpty;
//   }
// }
