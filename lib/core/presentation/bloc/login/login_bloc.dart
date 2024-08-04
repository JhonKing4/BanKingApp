import 'package:bankingapp/core/presentation/bloc/login/login_event.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_state.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final RegisterRepositoryImpl userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await userRepository.loginUser(event.phone, event.password);
        emit(UserSuccess());
      } catch (e) { // Cambié "error" por "e"
        print("Login error: $e");
        String errorMessage;
        if (e is DioError) {
          errorMessage = e.response?.data['message'] ?? 'Error al hacer el login';
        } else {
          errorMessage = e.toString();
        }
        emit(UserFailure(error: errorMessage)); 
      }
    });

    on<LogoutButtonPressed>((event, emit) async {
      emit(UserLoggedOut());
    });

    on<UserFailureHandledEvent>((event, emit) async {
      emit(UserFailureHandled());
    });
  }
}
