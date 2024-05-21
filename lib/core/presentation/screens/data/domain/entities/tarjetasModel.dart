import 'package:json_annotation/json_annotation.dart';

part 'tarjetasModel.g.dart';

@JsonSerializable()
class tarjetasModel{
  String tarjeta_pic;
  double saldo_tarjeta;
  String numero_tarjeta;



  tarjetasModel({

   required this.tarjeta_pic,
   required this.saldo_tarjeta,
   required this.numero_tarjeta
  });


factory tarjetasModel.fromJson(Map<String, dynamic> json) => _$tarjetasModelFromJson(json);

Map<String, dynamic> toJson() => _$tarjetasModelToJson(this);

}