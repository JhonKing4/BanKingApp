
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final double balance_general;
  final String tarjeta_pic;
  final double saldo_tarjeta;
  final String numero_tarjeta;


  const HomeState({
    this.balance_general = 0,
    this.tarjeta_pic = '',
    this.saldo_tarjeta = 0,
    this.numero_tarjeta = ''
  });

  factory HomeState.fromModel(homeModel model) {
    return HomeState(
      balance_general: model.balance_general,
      tarjeta_pic: model.tarjeta_pic,
      saldo_tarjeta: model.saldo_tarjeta,
      numero_tarjeta: model.numero_tarjeta
    );
  }

  HomeState copyWith({
    int? id_cuenta,
    double? balance_general, required bool isValid,
    String? tarjeta_pic,
    double? saldo_tarjeta,
    String? numero_tarjeta
  }) {
    return HomeState(
      balance_general: balance_general ?? this.balance_general,
      tarjeta_pic: tarjeta_pic ?? this.tarjeta_pic,
      saldo_tarjeta: saldo_tarjeta ?? this.saldo_tarjeta,
      numero_tarjeta: numero_tarjeta ?? this.numero_tarjeta
    );
  }

  @override
  List<Object?> get props => [
        balance_general,
        tarjeta_pic,
        saldo_tarjeta,
        numero_tarjeta
      ];
}
