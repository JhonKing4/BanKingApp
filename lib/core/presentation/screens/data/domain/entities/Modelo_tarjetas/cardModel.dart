import 'package:json_annotation/json_annotation.dart';

part 'cardModel.g.dart';

@JsonSerializable()
class CardModel {
  int id;
  int id_account;
  String card;
  String card_account;
  int status;

  CardModel({
    required this.id,
    required this.id_account,
    required this.card,
    required this.card_account,
    required this.status,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
  Map<String, dynamic> toJson() => _$CardModelToJson(this);
}
