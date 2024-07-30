// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

transferencia_accountModel _$transferencia_accountModelFromJson(
        Map<String, dynamic> json) =>
    transferencia_accountModel(
      user_account: json['user_account'] as String,
      receptor_account: json['receptor_account'] as String,
      amount: json['amount'] as double,
    );

Map<String, dynamic> _$transferencia_accountModelToJson(
        transferencia_accountModel instance) =>
    <String, dynamic>{
      'user_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'amount': instance.amount,
    };
