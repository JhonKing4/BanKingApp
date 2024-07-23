// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferencia2Model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

transferencia2Model _$transferencia2ModelFromJson(Map<String, dynamic> json) =>
    transferencia2Model(
      contacto_pic: json['contacto_pic'] as String,
      nombre_contacto: json['nombre_contacto'] as String,
      numero_tarjeta_contacto: json['numero_tarjeta_contacto'] as String,
      tarjeta_pic: json['tarjeta_pic'] as String,
      saldo_tarjeta: (json['saldo_tarjeta'] as num).toDouble(),
      numero_tarjeta: json['numero_tarjeta'] as String,
    );

Map<String, dynamic> _$transferencia2ModelToJson(
        transferencia2Model instance) =>
    <String, dynamic>{
      'contacto_pic': instance.contacto_pic,
      'nombre_contacto': instance.nombre_contacto,
      'numero_tarjeta_contacto': instance.numero_tarjeta_contacto,
      'tarjeta_pic': instance.tarjeta_pic,
      'saldo_tarjeta': instance.saldo_tarjeta,
      'numero_tarjeta': instance.numero_tarjeta,
    };
