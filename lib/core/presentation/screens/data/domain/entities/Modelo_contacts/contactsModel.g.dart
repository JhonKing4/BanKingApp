// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contactsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsModel _$ContactsModelFromJson(Map<String, dynamic> json) =>
    ContactsModel(
      id: (json['id'] as num?)?.toInt(),
      id_user: (json['id_user'] as num?)?.toInt(),
      bankname: json['bankname'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      nickname: json['nickname'] as String,
      account: json['account'] as String,
    );

Map<String, dynamic> _$ContactsModelToJson(ContactsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'email': instance.email,
      'phone': instance.phone,
      'bankname': instance.bankname,
      'nickname': instance.nickname,
      'account': instance.account,
    };
