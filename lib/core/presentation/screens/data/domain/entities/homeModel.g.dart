// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homeModel _$homeModelFromJson(Map<String, dynamic> json) => homeModel(
      id_cuenta: (json['id_cuenta'] as num).toInt(),
      balance_general: (json['balance_general'] as num).toDouble(),
      tarjeta_pic: json['tarjeta_pic'] as String,
      saldo_tarjeta: (json['saldo_tarjeta'] as num).toDouble(),
      numero_tarjeta: json['numero_tarjeta'] as String,
    );

Map<String, dynamic> _$homeModelToJson(homeModel instance) => <String, dynamic>{
      'id_cuenta': instance.id_cuenta,
      'balance_general': instance.balance_general,
      'tarjeta_pic': instance.tarjeta_pic,
      'saldo_tarjeta': instance.saldo_tarjeta,
      'numero_tarjeta': instance.numero_tarjeta,
    };
