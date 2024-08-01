// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transferencia_accountModel _$Transferencia_accountModelFromJson(
        Map<String, dynamic> json) =>
    Transferencia_accountModel(
      user_account: json['user_account'] as String,
      receptor_account: json['receptor_account'] as String,
      amount: json['amount'] as double,
    );

Map<String, dynamic> _$Transferencia_accountModelToJson(
        Transferencia_accountModel instance) =>
    <String, dynamic>{
      'user_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'amount': instance.amount,
    };
