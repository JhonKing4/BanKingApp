// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'servicioModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

servicioModel _$servicioModelFromJson(Map<String, dynamic> json) =>
    servicioModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$servicioModelToJson(servicioModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };
