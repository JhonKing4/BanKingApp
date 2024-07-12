import 'package:equatable/equatable.dart';

abstract class PerfilEvent extends Equatable {
  const PerfilEvent();

  @override
  List<Object?> get props => [];
}

class LoadPerfilDataEvent extends PerfilEvent {}

class NameChanged extends PerfilEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class LastNameChanged extends PerfilEvent {
  final String lastname;

  const LastNameChanged(this.lastname);

  @override
  List<Object?> get props => [lastname];
}

class EmailChanged extends PerfilEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class RFCChanged extends PerfilEvent {
  final String rfc;

  const RFCChanged(this.rfc);

  @override
  List<Object?> get props => [rfc];
}

class PhoneChanged extends PerfilEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class PasswordChanged extends PerfilEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class PerfilSubmitted extends PerfilEvent {}
