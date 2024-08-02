import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:equatable/equatable.dart';

abstract class TransferenciaAmountEvent extends Equatable {
  const TransferenciaAmountEvent();

  @override
  List<Object?> get props => [];
}

class LoadTransferenciaAmountDataEvent extends TransferenciaAmountEvent {}

class UserAccountChanged extends TransferenciaAmountEvent {
  final String user_account;

  const UserAccountChanged(this.user_account);

  @override
  List<Object?> get props => [user_account];
}

class ReceptorAccountChanged extends TransferenciaAmountEvent {
  final String receptor_account;

  const ReceptorAccountChanged(this.receptor_account);

  @override
  List<Object?> get props => [receptor_account];
}

class AmountChanged extends TransferenciaAmountEvent {
  final double? amount;

  const AmountChanged(this.amount);

  @override
  List<Object?> get props => [amount];
}

class SubmitRegisterTransferEvent extends TransferenciaAmountEvent  {
  final Transferencia_accountModel register;

  const SubmitRegisterTransferEvent (this.register);

  @override
  List<Object> get props => [register];
}