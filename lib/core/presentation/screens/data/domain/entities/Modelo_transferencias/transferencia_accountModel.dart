import 'package:json_annotation/json_annotation.dart';

part 'transferencia_contactoModel.g.dart';

@JsonSerializable()
class Transferencia_accountModel {
  int? id_sender;
  int? id_receptor;
  String? sender_account;
  String? user_account;
  String? receptor_account;
  String? concept;
  String? owner;
  int? amount;

  Transferencia_accountModel({
    this.id_sender,
    this.id_receptor,
    this.user_account,
    this.sender_account,
    required this.receptor_account,
    this.concept,
    this.owner,
    required this.amount,
  });

  factory Transferencia_accountModel.fromJson(Map<String, dynamic> json) => _$Transferencia_accountModelFromJson(json);

  Map<String, dynamic> toJson() => _$Transferencia_accountModelToJson(this);

  static List<Transferencia_accountModel> listFromJson(List<dynamic> json) {
    return json.map((e) => Transferencia_accountModel.fromJson(e)).toList();
  }

  Transferencia_accountModel copyWith({
    int? id_sender,
    int? id_receptor,
    String? user_account,
    String? sender_account,
    String? concept,
    String? owner,
    String? receptor_account,
    int? amount,
  }) {
    return Transferencia_accountModel(
      id_sender: id_sender ?? this.id_sender,
      id_receptor: id_receptor ?? this.id_receptor,
      user_account: user_account ?? this.user_account,
      sender_account: sender_account ?? this.sender_account,
      receptor_account: receptor_account ?? this.receptor_account,
      concept: concept ?? this.concept,
      owner: owner ?? this.owner,
      amount: amount ?? this.amount,
    );
  }
}
