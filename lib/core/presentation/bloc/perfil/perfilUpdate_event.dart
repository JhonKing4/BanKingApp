import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:equatable/equatable.dart';

abstract class PerfilUEvent extends Equatable {
  const PerfilUEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserEvent extends PerfilUEvent {
  final UsuariosModel user;

  const UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}
