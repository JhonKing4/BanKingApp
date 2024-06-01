import 'dart:ffi';

import 'package:equatable/equatable.dart';

abstract class TarjetasEvent extends Equatable {
  const TarjetasEvent();

  @override
  List<Object?> get props => [];
}

class LoadTarjetasDataEvent extends TarjetasEvent {}

class TarjetaPChanged extends TarjetasEvent {
  final String tarjeta_pic;

  const TarjetaPChanged(this.tarjeta_pic);

  @override
  List<Object?> get props => [tarjeta_pic];
}

class SaldoChanged extends TarjetasEvent {
  final double saldo_tarjeta;

  const SaldoChanged(this.saldo_tarjeta);

  @override
  List<Object?> get props => [saldo_tarjeta];
}

class NumeroTChanged extends TarjetasEvent {
  final String numero_tarjeta;

  const NumeroTChanged(this.numero_tarjeta);

  @override
  List<Object?> get props => [numero_tarjeta];
}



class FormSubmitted extends TarjetasEvent {}
