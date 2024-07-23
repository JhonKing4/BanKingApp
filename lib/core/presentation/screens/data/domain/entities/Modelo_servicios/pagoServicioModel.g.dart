// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagoServicioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PagoServicioModel _$PagoServicioModelFromJson(Map<String, dynamic> json) =>
    PagoServicioModel(
      id: (json['id'] as num?)?.toInt(),
      id_service: json['id_service'] as String,
      id_users: json['id_users'] as String,
      id_account: json['id_account'] as String,
      amount: json['amount'] as String,
      reference: json['reference'] as String,
    );

Map<String, dynamic> _$PagoServicioModelToJson(PagoServicioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_service': instance.id_service,
      'id_users': instance.id_users,
      'id_account': instance.id_account,
      'amount': instance.amount,
      'reference': instance.reference,
    };
