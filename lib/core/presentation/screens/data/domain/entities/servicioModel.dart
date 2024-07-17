import 'package:json_annotation/json_annotation.dart';

part 'servicioModel.g.dart';

@JsonSerializable()
class servicioModel {
  String servicio_pic;
  String nombre_servicio;

  servicioModel({
    required this.servicio_pic,
    required this.nombre_servicio,
  });

  factory servicioModel.fromJson(Map<String, dynamic> json) =>
      _$servicioModelFromJson(json);

  Map<String, dynamic> toJson() => _$servicioModelToJson(this);

  static List<servicioModel> listFromJson(List<dynamic> json) {
    return json.map((e) => servicioModel.fromJson(e)).toList();
  }
}
