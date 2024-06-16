import 'package:bankingapp/core/presentation/bloc/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final usecase.LoadHomeData loadHomeData;

  HomeBloc(this.loadHomeData) : super(const HomeState()) {
    on<LoadHomeDataEvent>((event, emit) async {
      final homeData = await loadHomeData();
      emit(HomeState.fromModel(homeData));
    });

    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(balance_general: event.balance_general, isValid: _validateForm()));
    });
    on<TarjetaPChanged>((event, emit) {
      emit(state.copyWith(tarjeta_pic: event.tarjeta_pic, isValid: _validateForm()));
    });
    on<SaldoChanged>((event, emit) {
      emit(state.copyWith(saldo_tarjeta: event.saldo_tarjeta, isValid: _validateForm()));
    });
    on<NumeroTChanged>((event, emit) {
      emit(state.copyWith(numero_tarjeta: event.numero_tarjeta, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return 
        state.balance_general != null &&
        state.tarjeta_pic.isNotEmpty &&
        state.saldo_tarjeta != null &&
        state.numero_tarjeta.isNotEmpty;
  }
}
