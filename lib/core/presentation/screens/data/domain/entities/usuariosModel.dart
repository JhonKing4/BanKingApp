import 'package:json_annotation/json_annotation.dart';

part 'usuariosModel.g.dart';

@JsonSerializable()
class UsuariosModel{
  String name;
  String lastname;
  String email;
  String rfc;
  String phone;
  String password;



  UsuariosModel({
   required this.name,
   required this.lastname,
   required this.email,
   required this.rfc,
   required this.phone,
   required this.password,
  });


factory UsuariosModel.fromJson(Map<String, dynamic> json) => _$UsuariosModelFromJson(json);

Map<String, dynamic> toJson() => _$UsuariosModelToJson(this);

}