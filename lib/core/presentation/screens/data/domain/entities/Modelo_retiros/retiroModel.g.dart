// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retiroModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

retiroModel _$retiroModelFromJson(Map<String, dynamic> json) => retiroModel(
      tarjeta_pic: json['tarjeta_pic'] as String,
      balance_tajeta: (json['balance_tajeta'] as num).toDouble(),
      numero_tarjeta: json['numero_tarjeta'] as String,
    );

Map<String, dynamic> _$retiroModelToJson(retiroModel instance) =>
    <String, dynamic>{
      'tarjeta_pic': instance.tarjeta_pic,
      'balance_tajeta': instance.balance_tajeta,
      'numero_tarjeta': instance.numero_tarjeta,
    };
