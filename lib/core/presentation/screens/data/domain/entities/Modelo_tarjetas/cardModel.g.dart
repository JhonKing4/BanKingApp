// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardModel _$CardModelFromJson(Map<String, dynamic> json) => CardModel(
      id: (json['id'] as num).toInt(),
      id_account: (json['id_account'] as num).toInt(),
      card: json['card'] as String,
      card_account: json['card_account'] as String,
      status: (json['status'] as num).toInt(),
    );

Map<String, dynamic> _$CardModelToJson(CardModel instance) => <String, dynamic>{
      'id': instance.id,
      'id_account': instance.id_account,
      'card': instance.card,
      'card_account': instance.card_account,
      'status': instance.status,
    };
