import 'package:json_annotation/json_annotation.dart';

part 'retiroModel.g.dart';

@JsonSerializable()
class retiroModel{
  String tarjeta_pic;
  double balance_tajeta;
  String numero_tarjeta;



  retiroModel({

   required this.tarjeta_pic,
   required this.balance_tajeta,
   required this.numero_tarjeta
  });


factory retiroModel.fromJson(Map<String, dynamic> json) => _$retiroModelFromJson(json);

Map<String, dynamic> toJson() => _$retiroModelToJson(this);

}