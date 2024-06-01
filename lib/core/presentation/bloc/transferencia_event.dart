import 'package:equatable/equatable.dart';

abstract class TransferenciaEvent extends Equatable {
  const TransferenciaEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransferenciaDataEvent extends TransferenciaEvent {}

class BalanceChanged extends TransferenciaEvent {
  final double balance;

  const BalanceChanged(this.balance);

  @override
  List<Object?> get props => [balance];
}

class ContactoChanged extends TransferenciaEvent {
  final String contacto_pic;

  const ContactoChanged(this.contacto_pic);

  @override
  List<Object?> get props => [contacto_pic];
}

class NombreCChanged extends TransferenciaEvent {
  final String nombre_contacto;

  const NombreCChanged(this.nombre_contacto);

  @override
  List<Object?> get props => [nombre_contacto];
}

class UltimaCChanged extends TransferenciaEvent {
  final String ultima_conexion;

  const UltimaCChanged(this.ultima_conexion);

  @override
  List<Object?> get props => [ultima_conexion];
}

class EstadoCChanged extends TransferenciaEvent {
  final String estado_conexion;

  const EstadoCChanged(this.estado_conexion);

  @override
  List<Object?> get props => [estado_conexion];
}


class FormSubmitted extends TransferenciaEvent {}
