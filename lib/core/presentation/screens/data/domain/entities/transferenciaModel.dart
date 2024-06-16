import 'package:json_annotation/json_annotation.dart';

part 'transferenciaModel.g.dart';


@JsonSerializable()
class transferenciaModel{
  double balance;
  String contacto_pic;
  String nombre_contacto;
  String ultima_conexion;
  bool estado_conexion;



  transferenciaModel({

   required this.balance,
   required this.contacto_pic,
   required this.nombre_contacto,
   required this.ultima_conexion,
   required this.estado_conexion
  });


factory transferenciaModel.fromJson(Map<String, dynamic> json) => _$transferenciaModelFromJson(json);

Map<String, dynamic> toJson() => _$transferenciaModelToJson(this);

}