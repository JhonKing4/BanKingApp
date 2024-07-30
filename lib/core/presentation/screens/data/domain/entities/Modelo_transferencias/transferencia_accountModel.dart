import 'package:json_annotation/json_annotation.dart';

part 'transferencia_contactoModel.g.dart';

@JsonSerializable()
class transferencia_accountModel{
  String user_account;
  String receptor_account;
  double? amount;



  transferencia_accountModel({

   required this.user_account,
   required this.receptor_account,
   required this.amount,
  });



factory transferencia_accountModel.fromJson(Map<String, dynamic> json) => _$transferencia_accountModelFromJson(json);

Map<String, dynamic> toJson() => _$transferencia_accountModelToJson(this);

}