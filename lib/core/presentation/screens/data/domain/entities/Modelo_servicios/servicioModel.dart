import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'servicioModel.g.dart';

@JsonSerializable()
class servicioModel {
  int?  id;
  String icono;
  String name;
  bool status;

  servicioModel({
    this.id,
    required this.icono,
    required this.name,
    required this.status,
  });

  factory servicioModel.fromJson(Map<String, dynamic> json) =>
      _$servicioModelFromJson(json);

  Map<String, dynamic> toJson() => _$servicioModelToJson(this);

  static List<servicioModel> listFromJson(List<dynamic> json) {
    return json.map((e) => servicioModel.fromJson(e)).toList();
  }
}
