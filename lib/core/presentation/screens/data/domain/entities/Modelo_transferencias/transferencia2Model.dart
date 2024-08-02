import 'package:json_annotation/json_annotation.dart';

part 'transferencia2Model.g.dart';

@JsonSerializable()
class transferencia2Model{
  String contacto_pic;
  String nombre_contacto;
  String numero_tarjeta_contacto;
  String tarjeta_pic;
  double saldo_tarjeta;
  String numero_tarjeta;




  transferencia2Model({

   required this.contacto_pic,
   required this.nombre_contacto,
   required this.numero_tarjeta_contacto,
   required this.tarjeta_pic,
   required this.saldo_tarjeta,
   required this.numero_tarjeta
  });



factory transferencia2Model.fromJson(Map<String, dynamic> json) => _$transferencia2ModelFromJson(json);

Map<String, dynamic> toJson() => _$transferencia2ModelToJson(this);

}