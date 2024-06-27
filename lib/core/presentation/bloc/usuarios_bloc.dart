// usuario_bloc.dart
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_event.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final usecase.RegisterUser registerUser;

  UsuarioBloc(this.registerUser) : super(const UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is LoadUsuarioDataEvent) {
      // Manejar carga de datos iniciales si es necesario
    } else if (event is NameChanged) {
      yield state.copyWith(name: event.name, isValid: _validateForm());
    } else if (event is LastNameChanged) {
      yield state.copyWith(lastname: event.lastname, isValid: _validateForm());
    } else if (event is EmailChanged) {
      yield state.copyWith(email: event.email, isValid: _validateForm());
    } else if (event is RFCChanged) {
      yield state.copyWith(rfc: event.rfc, isValid: _validateForm());
    } else if (event is PhoneChanged) {
      yield state.copyWith(phone: event.phone, isValid: _validateForm());
    } else if (event is PasswordChanged) {
      yield state.copyWith(password: event.password, isValid: _validateForm());
    } else if (event is SubmitForm) {
      if (state.isValid) {
        try {
          await registerUser.call(
            UsuariosModel(
              name: state.name,
              lastname: state.lastname,
              email: state.email,
              rfc: state.rfc,
              phone: state.phone,
              password: state.password,
            ),
            email: state.email,
            lastname: state.lastname,
            name: state.name,
            password: state.password,
            phone: state.phone,
            rfc: state.rfc,
          );
          // Manejar registro exitoso
        } catch (e) {
          // Manejar error
        }
      }
    }
  }

  bool _validateForm() {
    return state.name.isNotEmpty &&
        state.lastname.isNotEmpty &&
        state.email.isNotEmpty &&
        state.rfc.isNotEmpty &&
        state.phone.isNotEmpty &&
        state.password.isNotEmpty &&
        state.id_bank > 0;
  }
}
