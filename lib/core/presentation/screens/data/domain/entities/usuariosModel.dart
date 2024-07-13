import 'package:json_annotation/json_annotation.dart';

part 'usuariosModel.g.dart';

@JsonSerializable()
class UsuariosModel{
  int? id;
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;
  int id_bank;



  UsuariosModel({
   this.id,
   required this.name,
   required this.lastname,
   required this.email,
   required this.rfc,
   required this.phone,
   required this.password,
   required this.id_bank,
  });


factory UsuariosModel.fromJson(Map<String, dynamic> json) => _$UsuariosModelFromJson(json);

Map<String, dynamic> toJson() => _$UsuariosModelToJson(this);

}