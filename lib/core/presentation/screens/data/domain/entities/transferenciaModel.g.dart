// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferenciaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

transferenciaModel _$transferenciaModelFromJson(Map<String, dynamic> json) =>
    transferenciaModel(
      balance: (json['balance'] as num).toDouble(),
      contacto_pic: json['contacto_pic'] as String,
      nombre_contacto: json['nombre_contacto'] as String,
      ultima_conexion: DateTime.parse(json['ultima_conexion'] as String),
      estado_conexion: json['estado_conexion'] as bool,
    );

Map<String, dynamic> _$transferenciaModelToJson(transferenciaModel instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'contacto_pic': instance.contacto_pic,
      'nombre_contacto': instance.nombre_contacto,
      'ultima_conexion': instance.ultima_conexion.toIso8601String(),
      'estado_conexion': instance.estado_conexion,
    };
