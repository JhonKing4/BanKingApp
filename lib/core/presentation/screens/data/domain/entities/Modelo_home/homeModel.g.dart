// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

homeModel _$homeModelFromJson(Map<String, dynamic> json) => homeModel(
      usuario_pic: json['usuario_pic'] as String,
      usuario_name: json['usuario_name'] as String,
      balance_general: (json['balance_general'] as num).toDouble(),
    );

Map<String, dynamic> _$homeModelToJson(homeModel instance) => <String, dynamic>{
      'usuario_pic': instance.usuario_pic,
      'usuario_name': instance.usuario_name,
      'balance_general': instance.balance_general,
    };
