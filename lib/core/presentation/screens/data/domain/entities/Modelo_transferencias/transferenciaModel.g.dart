// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transferenciaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

transferenciaModel _$transferenciaModelFromJson(Map<String, dynamic> json) =>
    transferenciaModel(
      contacto_pic: json['contacto_pic'] as String,
      nombre_contacto: json['nombre_contacto'] as String,
      ultima_conexion: json['ultima_conexion'] as String,
      estado_conexion: json['estado_conexion'] as bool,
    );

Map<String, dynamic> _$transferenciaModelToJson(transferenciaModel instance) =>
    <String, dynamic>{
      'contacto_pic': instance.contacto_pic,
      'nombre_contacto': instance.nombre_contacto,
      'ultima_conexion': instance.ultima_conexion,
      'estado_conexion': instance.estado_conexion,
    };
