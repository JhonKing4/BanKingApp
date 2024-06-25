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
    on<PicChanged>((event, emit) {
      emit(state.copyWith(balance_general: event.usuario_pic, isValid: _validateForm()));
    });
     on<NameChanged>((event, emit) {
      emit(state.copyWith(balance_general: event.usuario_name, isValid: _validateForm()));
    });
    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(balance_general: event.balance_general, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return 
        state.usuario_pic.isNotEmpty &&
        state.usuario_name.isNotEmpty &&
        state.balance_general != Null;
  }
}
