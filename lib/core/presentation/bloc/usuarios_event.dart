import 'package:equatable/equatable.dart';

abstract class UsuarioEvent extends Equatable {
  const UsuarioEvent();

  @override
  List<Object?> get props => [];
}

class LoadUsuarioDataEvent extends UsuarioEvent {}

class IdChanged extends UsuarioEvent {
  final int id;

  const IdChanged(this.id);

  @override
  List<Object?> get props => [id];
}

class NameChanged extends UsuarioEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class LastNameChanged extends UsuarioEvent {
  final String lastname;

  const LastNameChanged(this.lastname);

  @override
  List<Object?> get props => [lastname];
}

class EmailChanged extends UsuarioEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RFCChanged extends UsuarioEvent {
  final String rfc;

  const RFCChanged(this.rfc);

  @override
  List<Object?> get props => [rfc];
}

class PhoneChanged extends UsuarioEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class PasswordChanged extends UsuarioEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}


class IdbankChanged extends UsuarioEvent {
  final int id_bank;

  const IdbankChanged(this.id_bank);

  @override
  List<Object?> get props => [id_bank];
}


class FormSubmitted extends UsuarioEvent {}
