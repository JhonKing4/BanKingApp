// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

servicioModel _$servicioModelFromJson(Map<String, dynamic> json) =>
    servicioModel(
      servicio_pic: json['servicio_pic'] as String,
      nombre_servicio: json['nombre_servicio'] as String,
    );

Map<String, dynamic> _$servicioModelToJson(servicioModel instance) =>
    <String, dynamic>{
      'servicio_pic': instance.servicio_pic,
      'nombre_servicio': instance.nombre_servicio,
    };
