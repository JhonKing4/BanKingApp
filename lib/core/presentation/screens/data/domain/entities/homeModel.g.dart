// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homeModel _$homeModelFromJson(Map<String, dynamic> json) => homeModel(
      usuario_pic: json['usuario_pic'] as String? ?? '',
      balance_general: (json['balance_general'] as num?)?.toDouble() ?? 0.0,
      tarjeta_pic: json['tarjeta_pic'] as String? ?? '',
      saldo_tarjeta: (json['saldo_tarjeta'] as num?)?.toDouble() ?? 0.0,
      numero_tarjeta: json['numero_tarjeta'] as String? ?? '',
    );

Map<String, dynamic> _$homeModelToJson(homeModel instance) => <String, dynamic>{
      'usuario_pic': instance.usuario_pic,
      'balance_general': instance.balance_general,
      'tarjeta_pic': instance.tarjeta_pic,
      'saldo_tarjeta': instance.saldo_tarjeta,
      'numero_tarjeta': instance.numero_tarjeta,
    };
