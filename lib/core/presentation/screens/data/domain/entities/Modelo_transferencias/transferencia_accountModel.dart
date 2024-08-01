import 'package:json_annotation/json_annotation.dart';

part 'transferencia_contactoModel.g.dart';

@JsonSerializable()
class Transferencia_accountModel{
  String user_account;
  String receptor_account;
  double? amount;



  Transferencia_accountModel({

   required this.user_account,
   required this.receptor_account,
   required this.amount,
  });



factory Transferencia_accountModel.fromJson(Map<String, dynamic> json) => _$Transferencia_accountModelFromJson(json);

Map<String, dynamic> toJson() => _$Transferencia_accountModelToJson(this);

}