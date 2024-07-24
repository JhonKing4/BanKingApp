import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_tarjetas/cardModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:equatable/equatable.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object?> get props => [];
}

class LoadAccountDataEvent extends AccountEvent {}

class IdChanged extends AccountEvent {
  final int id;

  const IdChanged(this.id);

  @override
  List<Object?> get props => [id];
}

class UserIdChanged extends AccountEvent {
  final int id_user;

  const UserIdChanged(this.id_user);

  @override
  List<Object?> get props => [id_user];
}

class BalanceChanged extends AccountEvent {
  final double balance;

  const BalanceChanged(this.balance);

  @override
  List<Object?> get props => [balance];
}

class StatusChanged extends AccountEvent {
  final int status;

  const StatusChanged(this.status);

  @override
  List<Object?> get props => [status];
}

class CardListChanged extends AccountEvent {
  final List<CardModel> card;

  const CardListChanged(this.card);

  @override
  List<Object?> get props => [card];
}

class UserChanged extends AccountEvent {
  final UsuariosModel user;

  const UserChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AccountSubmitted extends AccountEvent {}
