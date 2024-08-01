import 'package:equatable/equatable.dart';

abstract class MovimientosEvent extends Equatable {
  const MovimientosEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovimientosDataEvent extends MovimientosEvent {}

class SenderIdChanged extends MovimientosEvent {
  final int idSender;

  const SenderIdChanged(this.idSender);

  @override
  List<Object?> get props => [idSender];
}

class ReceptorIdChanged extends MovimientosEvent {
  final int idReceptor;

  const ReceptorIdChanged(this.idReceptor);

  @override
  List<Object?> get props => [idReceptor];
}

class UserAccountChanged extends MovimientosEvent {
  final String userAccount;

  const UserAccountChanged(this.userAccount);

  @override
  List<Object?> get props => [userAccount];
}

class ReceptorAccountChanged extends MovimientosEvent {
  final String receptorAccount;

  const ReceptorAccountChanged(this.receptorAccount);

  @override
  List<Object?> get props => [receptorAccount];
}

class AmountChanged extends MovimientosEvent {
  final int? amount;

  const AmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class FormSubmitted extends MovimientosEvent {}
