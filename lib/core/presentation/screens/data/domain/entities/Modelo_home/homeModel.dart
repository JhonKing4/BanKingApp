import 'package:json_annotation/json_annotation.dart';

part 'homeModel.g.dart';

@JsonSerializable()
class homeModel {
  String usuario_pic;
  String usuario_name;
  double balance_general;


  homeModel({
    required this.usuario_pic,
    required this.usuario_name,
    required this.balance_general,
  });

  factory homeModel.fromJson(Map<String, dynamic> json) => _$homeModelFromJson(json);

  Map<String, dynamic> toJson() => _$homeModelToJson(this);
}
