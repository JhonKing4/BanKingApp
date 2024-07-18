import 'package:bankingapp/core/presentation/bloc/registro/usuarios_event.dart';
import 'package:bankingapp/core/presentation/bloc/registro/usuarios_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final usecase.SubmitRegister submitRegister;

  RegisterBloc(this.submitRegister) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitRegister(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Error al enviar el formualrio'));
      }
    });
  }
}