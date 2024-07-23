
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_retiros/retiroModel.dart';
import 'package:equatable/equatable.dart';

class RetiroState extends Equatable {
  final String tarjeta_pic;
  final double balance_tajeta;
  final String numero_tarjeta;

  const RetiroState({
    this.tarjeta_pic = '',
    this.balance_tajeta = 0,
    this.numero_tarjeta = '',
  });

  factory RetiroState.fromModel(retiroModel model) {
    return RetiroState(
      tarjeta_pic: model.tarjeta_pic,
      balance_tajeta: model.balance_tajeta,
      numero_tarjeta: model.numero_tarjeta,
    );
  }

  RetiroState copyWith({
    String? tarjeta_pic,
    double? balance_tajeta, required bool isValid,
    String? numero_tarjeta, 
  }) {
    return RetiroState(
      tarjeta_pic: tarjeta_pic ?? this.tarjeta_pic,
      balance_tajeta: balance_tajeta ?? this.balance_tajeta,
      numero_tarjeta: numero_tarjeta ?? this.numero_tarjeta,
    );
  }

  @override
  List<Object?> get props => [
        tarjeta_pic,
        balance_tajeta,
        numero_tarjeta,
      ];
}
