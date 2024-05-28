

import 'package:equatable/equatable.dart';

abstract class Transferencia2Event extends Equatable {
  const Transferencia2Event();

  @override
  List<Object?> get props => [];
}

class LoadFormDataEvent extends Transferencia2Event {}

class ContactoChanged extends Transferencia2Event {
  final String contacto_pic;

  const ContactoChanged(this.contacto_pic);

  @override
  List<Object?> get props => [contacto_pic];
}

class NombreCChanged extends Transferencia2Event {
  final String nombre_contacto;

  const NombreCChanged(this.nombre_contacto);

  @override
  List<Object?> get props => [nombre_contacto];
}

class NumeroTCChanged extends Transferencia2Event {
  final String numero_tarjeta_contacto;

  const NumeroTCChanged(this.numero_tarjeta_contacto);

  @override
  List<Object?> get props => [numero_tarjeta_contacto];
}

class TarjetaPicChanged extends Transferencia2Event {
  final String tarjeta_pic;

  const TarjetaPicChanged(this.tarjeta_pic);

  @override
  List<Object?> get props => [tarjeta_pic];
}

class SaldoTChanged extends Transferencia2Event {
  final double saldo_tarjeta;

  const SaldoTChanged(this.saldo_tarjeta);

  @override
  List<Object?> get props => [saldo_tarjeta];
}

class NumeroTarChanged extends Transferencia2Event {
  final String numero_tarjeta;

  const NumeroTarChanged(this.numero_tarjeta);

  @override
  List<Object?> get props => [numero_tarjeta];
}


class FormSubmitted extends Transferencia2Event {}
