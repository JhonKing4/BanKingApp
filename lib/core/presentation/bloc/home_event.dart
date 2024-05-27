import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadFormDataEvent extends HomeEvent {}

class IdCuentaChanged extends HomeEvent {
  final int id_cuenta;

  const IdCuentaChanged(this.id_cuenta);

  @override
  List<Object?> get props => [id_cuenta];
}

class BalanceChanged extends HomeEvent {
  final double balance_general;

  const BalanceChanged(this.balance_general);

  @override
  List<Object?> get props => [balance_general];
}

class TarjetaPChanged extends HomeEvent {
  final String tarjeta_pic;

  const TarjetaPChanged(this.tarjeta_pic);

  @override
  List<Object?> get props => [tarjeta_pic];
}

class SaldoChanged extends HomeEvent {
  final double saldo_tarjeta;

  const SaldoChanged(this.saldo_tarjeta);

  @override
  List<Object?> get props => [saldo_tarjeta];
}

class NumeroTChanged extends HomeEvent {
  final String numero_tarjeta;

  const NumeroTChanged(this.numero_tarjeta);

  @override
  List<Object?> get props => [numero_tarjeta];
}

class FormSubmitted extends HomeEvent {}
