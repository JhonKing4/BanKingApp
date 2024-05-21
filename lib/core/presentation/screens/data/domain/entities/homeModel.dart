import 'package:json_annotation/json_annotation.dart';

part 'homeModel.g.dart';

@JsonSerializable()
class homeModel{
  int id_cuenta;
  double balance_general;
  String tarjeta_pic;
  double saldo_tarjeta;
  String numero_tarjeta;



  homeModel({

   required this.id_cuenta,
   required this.balance_general,
   required this.tarjeta_pic,
   required this.saldo_tarjeta,
   required this.numero_tarjeta
  });



factory homeModel.fromJson(Map<String, dynamic> json) => _$homeModelFromJson(json);

Map<String, dynamic> toJson() => _$homeModelToJson(this);

}