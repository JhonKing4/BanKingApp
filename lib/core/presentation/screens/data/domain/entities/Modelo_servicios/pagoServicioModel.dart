import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'pagoServicioModel.g.dart';

@JsonSerializable()
class PagoServicioModel {
  int?  id;
  String id_service;
  String id_users;
  String id_account;
  String amount;
  String reference;

  PagoServicioModel({
    this.id,
    required this.id_service,
    required this.id_users,
    required this.id_account,
    required this.amount,
    required this.reference
  });

  factory PagoServicioModel.fromJson(Map<String, dynamic> json) =>
      _$PagoServicioModelFromJson(json);

  Map<String, dynamic> toJson() => _$PagoServicioModelToJson(this);

  static List<PagoServicioModel> listFromJson(List<dynamic> json) {
    return json.map((e) => PagoServicioModel.fromJson(e)).toList();
  }
}
