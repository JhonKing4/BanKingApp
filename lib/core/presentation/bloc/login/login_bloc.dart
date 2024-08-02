import 'package:bankingapp/core/presentation/bloc/login/login_event.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_state.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RegisterRepositoryImpl userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.loginUser(event.phone, event.password);
        emit(UserSuccess()); // Emitir UserSuccess en caso de éxito
      } catch (error) {
        print("Login error: $error"); // Para depuración
        emit(UserFailure(error: error.toString())); // Emitir UserFailure en caso de error
      }
    });
      on<LogoutButtonPressed>((event, emit) async {
      emit(UserLoggedOut());
    });
  }
}
