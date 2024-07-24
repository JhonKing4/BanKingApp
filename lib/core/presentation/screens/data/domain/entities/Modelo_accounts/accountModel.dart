import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_tarjetas/cardModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accountModel.g.dart';

@JsonSerializable()
class AccountModel {
  int? id;
  int id_user;
  double balance;
  int status;
  List<CardModel> card;
  UsuariosModel? user;

  AccountModel({
    required this.id,
    required this.id_user,
    required this.balance,
    required this.status,
    required this.card,
    required this.user,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}
