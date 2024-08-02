import 'package:equatable/equatable.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_tarjetas/cardModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';

class AccountState extends Equatable {
  final int? id;
  final int id_user;
  final double balance;
  final int status;
  final List<CardModel> card;
  final UsuariosModel? user;

  const AccountState({
    this.id = 0,
    this.id_user = 0,
    this.balance = 0,
    this.status = 0,
    this.card = const <CardModel>[],
    this.user,
  });

  factory AccountState.fromModel(AccountModel model) {
    return AccountState(
      id: model.id,
      id_user: model.id_user,
      balance: model.balance,
      status: model.status,
      card: model.card ?? [],
      user: model.user,
    );
  }
  AccountState copyWith({
    int? id,
    int? id_user,
    double? balance,
    int? status,
    List<CardModel>? card,
    UsuariosModel? user, required bool isValid,
  }) {
    return AccountState(
      id: id ?? this.id,
      id_user: id_user ?? this.id_user,
      balance: balance ?? this.balance,
      status: status ?? this.status,
      card: card ?? this.card,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [id, id_user, balance, status, card, user];
}


class AccountLoading extends AccountState {}

class AccountLoaded extends AccountState {}
