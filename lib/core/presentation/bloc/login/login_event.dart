import 'package:equatable/equatable.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends UserEvent {
  final String phone;
  final String password;

  const LoginButtonPressed(this.phone, this.password);

  @override
  List<Object> get props => [phone, password];
}
