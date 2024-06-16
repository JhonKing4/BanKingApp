import 'package:json_annotation/json_annotation.dart';

part 'homeModel.g.dart';

@JsonSerializable()
class homeModel {
  @JsonKey(defaultValue: '')
  String usuario_pic;

  @JsonKey(defaultValue: 0.0)
  double balance_general;

  @JsonKey(defaultValue: '')
  String tarjeta_pic;

  @JsonKey(defaultValue: 0.0)
  double saldo_tarjeta;

  @JsonKey(defaultValue: '')
  String numero_tarjeta;

  homeModel({
    required this.usuario_pic,
    required this.balance_general,
    required this.tarjeta_pic,
    required this.saldo_tarjeta,
    required this.numero_tarjeta,
  });

  factory homeModel.fromJson(Map<String, dynamic> json) => _$homeModelFromJson(json);

  Map<String, dynamic> toJson() => _$homeModelToJson(this);
}
