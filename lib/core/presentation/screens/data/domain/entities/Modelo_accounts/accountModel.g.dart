// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: (json['id'] as num?)?.toInt(),
      id_user: (json['id_user'] as num).toInt(),
      balance: (json['balance'] as num).toDouble(),
      status: (json['status'] as num).toInt(),
      card: (json['card'] as List<dynamic>)
          .map((e) => CardModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : UsuariosModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'balance': instance.balance,
      'status': instance.status,
      'card': instance.card,
      'user': instance.user,
    };
