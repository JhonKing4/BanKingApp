import 'package:json_annotation/json_annotation.dart';

part 'tarjetasModel.g.dart';

@JsonSerializable()
class tarjetasModel {
  String tarjeta_pic;
  String numero_tarjeta;
  double saldo_tarjeta;

  tarjetasModel({
    required this.tarjeta_pic,
    required this.numero_tarjeta,
    required this.saldo_tarjeta
  });

  factory tarjetasModel.fromJson(Map<String, dynamic> json) =>
      _$tarjetasModelFromJson(json);

  Map<String, dynamic> toJson() => _$tarjetasModelToJson(this);

  static List<tarjetasModel> listFromJson(List<dynamic> json) {
    return json.map((e) => tarjetasModel.fromJson(e)).toList();
  }
}