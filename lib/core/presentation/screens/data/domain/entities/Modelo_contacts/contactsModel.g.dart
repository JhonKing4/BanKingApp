// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsModel _$ContactsModelFromJson(Map<String, dynamic> json) =>
    ContactsModel(
      id: (json['id'] as num?)?.toInt(),
      id_user: (json['id_user'] as num?)?.toInt(),
      nickname: json['nickname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$ContactsModelToJson(ContactsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'nickname': instance.nickname,
      'account': instance.account,
    };
