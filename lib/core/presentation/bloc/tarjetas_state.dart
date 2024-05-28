
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:equatable/equatable.dart';

class TarjetasState extends Equatable {
  final String tarjeta_pic;
  final double saldo_tarjeta;
  final String numero_tarjeta;


  const TarjetasState({
    this.tarjeta_pic = '',
    this.saldo_tarjeta = 0,
    this.numero_tarjeta = '',
  });

  factory TarjetasState.fromModel(tarjetasModel model) {
    return TarjetasState(
      tarjeta_pic: model.tarjeta_pic,
      saldo_tarjeta: model.saldo_tarjeta,
      numero_tarjeta: model.numero_tarjeta
    );
  }

  TarjetasState copyWith({
    String? tarjeta_pic,
    double? saldo_tarjeta, required bool isValid,
    String? numero_tarjeta,
  }) {
    return TarjetasState(
      tarjeta_pic: tarjeta_pic ?? this.tarjeta_pic,
      saldo_tarjeta: saldo_tarjeta ?? this.saldo_tarjeta,
      numero_tarjeta: numero_tarjeta ?? this.numero_tarjeta
    );
  }

  @override
  List<Object?> get props => [
        tarjeta_pic,
        saldo_tarjeta,
        numero_tarjeta
      ];
}
