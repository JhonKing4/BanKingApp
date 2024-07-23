import 'package:json_annotation/json_annotation.dart';

part 'beneficioModel.g.dart';

@JsonSerializable()
class beneficioModel{
  String beneficio_pic;
  String nombre_beneficio;
  String tipo_beneficio;



  beneficioModel({

   required this.beneficio_pic,
   required this.nombre_beneficio,
   required this.tipo_beneficio
  });


factory beneficioModel.fromJson(Map<String, dynamic> json) => _$beneficioModelFromJson(json);

Map<String, dynamic> toJson() => _$beneficioModelToJson(this);

}