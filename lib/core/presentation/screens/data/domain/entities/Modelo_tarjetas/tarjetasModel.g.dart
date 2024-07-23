// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarjetasModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

tarjetasModel _$tarjetasModelFromJson(Map<String, dynamic> json) =>
    tarjetasModel(
      tarjeta_pic: json['tarjeta_pic'] as String,
      numero_tarjeta: json['numero_tarjeta'] as String,
      saldo_tarjeta: (json['saldo_tarjeta'] as num).toDouble(),
    );

Map<String, dynamic> _$tarjetasModelToJson(tarjetasModel instance) =>
    <String, dynamic>{
      'tarjeta_pic': instance.tarjeta_pic,
      'numero_tarjeta': instance.numero_tarjeta,
      'saldo_tarjeta': instance.saldo_tarjeta,
    };
