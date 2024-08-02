import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final usecase.LoadAccountData loadAccountData;

  AccountBloc(this.loadAccountData) : super(const AccountState()) {
    on<LoadAccountDataEvent>((event, emit) async {
      final accountData = await loadAccountData();
      emit(AccountState.fromModel(accountData));
    });
    on<IdChanged>((event, emit) {
      emit(state.copyWith(id: event.id, isValid: _validateForm()));
    });
    on<UserIdChanged>((event, emit) {
      emit(state.copyWith(id_user: event.id_user, isValid: _validateForm()));
    });
    on<BalanceChanged>((event, emit) {
      emit(state.copyWith(balance: event.balance, isValid: _validateForm()));
    });
    on<StatusChanged>((event, emit) {
      emit(state.copyWith(status: event.status, isValid: _validateForm()));
    });
    on<CardListChanged>((event, emit) {
      emit(state.copyWith(card: event.card, isValid: _validateForm()));
    });
    on<UserChanged>((event, emit) {
      emit(state.copyWith(user: event.user, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return
      state.id != null &&
      state.id_user != 0 &&
      state.balance != 0 &&
      state.status != 0 &&
      state.card != null &&
      state.user != null;
  }
}
