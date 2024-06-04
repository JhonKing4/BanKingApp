import 'package:equatable/equatable.dart';

abstract class RetiroEvent extends Equatable {
  const RetiroEvent();

  @override
  List<Object?> get props => [];
}

class LoadRetiroDataEvent extends RetiroEvent {}

class TarjetaPChanged extends RetiroEvent {
  final String tarjeta_pic;

  const TarjetaPChanged(this.tarjeta_pic);

  @override
  List<Object?> get props => [tarjeta_pic];
}

class BalanceTChanged extends RetiroEvent {
  final double balance_tajeta;

  const BalanceTChanged(this.balance_tajeta);

  @override
  List<Object?> get props => [balance_tajeta];
}

class NumeroTChanged extends RetiroEvent {
  final String numero_tarjeta;

  const NumeroTChanged(this.numero_tarjeta);

  @override
  List<Object?> get props => [numero_tarjeta];
}


class FormSubmitted extends RetiroEvent {}
