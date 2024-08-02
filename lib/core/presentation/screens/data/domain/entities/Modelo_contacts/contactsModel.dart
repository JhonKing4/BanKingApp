import 'package:json_annotation/json_annotation.dart';

part 'contactsModel.g.dart';

@JsonSerializable()
class ContactsModel{
  int? id;
  int? id_user;
  String nickname;
  String email;
  String phone;
  String bankname;
  String account;



  ContactsModel({
   this.id,
   this.id_user,
   required this.email,
   required this.phone,
   required this.bankname,
   required this.nickname,
   required this.account,
  });


factory ContactsModel.fromJson(Map<String, dynamic> json) => _$ContactsModelFromJson(json);

Map<String, dynamic> toJson() => _$ContactsModelToJson(this);

  static List<ContactsModel> listFromJson(List<dynamic> json) {
    return json.map((e) => ContactsModel.fromJson(e)).toList();
  }
}