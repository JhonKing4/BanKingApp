
// import 'package:bankingapp/core/presentation/bloc/home_event.dart';
// import 'package:bankingapp/core/presentation/bloc/home_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HomeBloc extends Bloc<HomeEvent, HomeState> {
//   final usecase.LoadFormData loadFormData;

//   HomeBloc(this.loadFormData) : super(const HomeState()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(HomeState.fromModel(formData));
//     });

//     on<IdCuentaChanged>((event, emit) {
//       emit(state.copyWith(id_cuenta: event.id_cuenta, isValid: _validateForm()));
//     });
//     on<BalanceChanged>((event, emit) {
//       emit(state.copyWith(balance_general: event.balance_general, isValid: _validateForm()));
//     });
//     on<TarjetaPChanged>((event, emit) {
//       emit(state.copyWith(tarjeta_pic: event.tarjeta_pic, isValid: _validateForm()));
//     });
//     on<SaldoChanged>((event, emit) {
//       emit(state.copyWith(saldo_tarjeta: event.saldo_tarjeta, isValid: _validateForm()));
//     });
//     on<NumeroTChanged>((event, emit) {
//       emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
//     });
//   }

//   bool _validateForm() {
//     return state.id_cuenta != null &&
//         state.balance_general != null &&
//         state.tarjeta_pic.isNotEmpty &&
//         state.saldo_tarjeta != null &&
//         state.numero_tarjeta.isNotEmpty;
//   }
// }
