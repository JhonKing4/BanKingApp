// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beneficioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

beneficioModel _$beneficioModelFromJson(Map<String, dynamic> json) =>
    beneficioModel(
      beneficio_pic: json['beneficio_pic'] as String,
      nombre_beneficio: json['nombre_beneficio'] as String,
      tipo_beneficio: json['tipo_beneficio'] as String,
    );

Map<String, dynamic> _$beneficioModelToJson(beneficioModel instance) =>
    <String, dynamic>{
      'beneficio_pic': instance.beneficio_pic,
      'nombre_beneficio': instance.nombre_beneficio,
      'tipo_beneficio': instance.tipo_beneficio,
    };
