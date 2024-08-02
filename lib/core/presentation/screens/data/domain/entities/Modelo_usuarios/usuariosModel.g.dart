// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuariosModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuariosModel _$UsuariosModelFromJson(Map<String, dynamic> json) =>
    UsuariosModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      rfc: json['rfc'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      id_bank: (json['id_bank'] as num).toInt(),
    );

Map<String, dynamic> _$UsuariosModelToJson(UsuariosModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lastname': instance.lastname,
      'email': instance.email,
      'rfc': instance.rfc,
      'phone': instance.phone,
      'password': instance.password,
      'id_bank': instance.id_bank,
    };
