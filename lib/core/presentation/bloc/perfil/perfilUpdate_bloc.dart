import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:bloc/bloc.dart';

class PerfilUBloc extends Bloc<PerfilUEvent, PerfilUState> {
  final RegisterRepository repository;

  PerfilUBloc(this.repository) : super(PerfilUInitial()) {
    on<UpdateUserEvent>(_onUpdateUser);
  }

  Future<void> _onUpdateUser(UpdateUserEvent event, Emitter<PerfilUState> emit) async {
    emit(PerfilULoading());
    try {
      await repository.updateUser(event.user);
      emit(PerfilUSuccess('Usuario actualizado correctamente'));
    } catch (e) {
      emit(PerfilUFailure(e.toString()));
    }
  }
}
