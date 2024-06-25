import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class LoadHomeDataEvent extends HomeEvent {}

class PicChanged extends HomeEvent {
  final double usuario_pic;

  const PicChanged(this.usuario_pic);

  @override
  List<Object?> get props => [usuario_pic];
}

class NameChanged extends HomeEvent {
  final double usuario_name;

  const NameChanged(this.usuario_name);

  @override
  List<Object?> get props => [usuario_name];
}

class BalanceChanged extends HomeEvent {
  final double balance_general;

  const BalanceChanged(this.balance_general);

  @override
  List<Object?> get props => [balance_general];
}


class HomeSubmitted extends HomeEvent {}
