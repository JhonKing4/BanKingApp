import 'package:bankingapp/core/presentation/bloc/perfil/perfil_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilBloc extends Bloc<PerfilEvent, PerfilState> {
  final usecase.LoadPerfilData loadPerfilData;

  PerfilBloc(this.loadPerfilData) : super(const PerfilState()) {
    on<LoadPerfilDataEvent>((event, emit) async {
      final perfilData = await loadPerfilData();
      emit(PerfilState.fromModel(perfilData));
    });
    on<IdChanged>((event, emit) {
      emit(state.copyWith(id: event.id, isValid: _validateForm()));
    });
     on<NameChanged>((event, emit) {
      emit(state.copyWith(name: event.name, isValid: _validateForm()));
    });
     on<LastNameChanged>((event, emit) {
      emit(state.copyWith(lastname: event.lastname, isValid: _validateForm()));
    });
     on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email, isValid: _validateForm()));
    });
     on<RFCChanged>((event, emit) {
      emit(state.copyWith(rfc: event.rfc, isValid: _validateForm()));
    });
     on<PhoneChanged>((event, emit) {
      emit(state.copyWith(phone: event.phone, isValid: _validateForm()));
    });
      on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password, isValid: _validateForm()));
    });
  }

  bool _validateForm() {
    return 
        state.id !=  0 &&
        state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty;
  }
}
