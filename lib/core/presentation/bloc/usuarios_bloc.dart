import 'package:bankingapp/core/presentation/bloc/usuarios_event.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SubmitRegister submitRegister;

  RegisterBloc(this.submitRegister) : super(RegisterInitial()) {
    on<SubmitRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitRegister(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Failed to submit Register'));
      }
    });
  }
}