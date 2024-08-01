// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia_accountModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transferencia_accountModel _$Transferencia_accountModelFromJson(
        Map<String, dynamic> json) =>
    Transferencia_accountModel( 
      id_sender: json['id_sender'] as int?,
      id_receptor: json['id_receptor'] as int?,
      user_account: json['user_account'] as String?,
      sender_account: json['sender_account'] as String?,
      receptor_account: json['receptor_account'] as String?,
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$Transferencia_accountModelToJson(
        Transferencia_accountModel instance) =>
    <String, dynamic>{
      'id_sender': instance.id_sender,
      'id_receptor': instance.id_receptor,
      'user_account': instance.user_account,
      'sender_account': instance.user_account,
      'receptor_account': instance.receptor_account,
      'amount': instance.amount,
    };
