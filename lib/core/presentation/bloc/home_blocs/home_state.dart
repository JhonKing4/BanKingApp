
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_home/homeModel.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String usuario_pic;
  final String usuario_name;
  final double balance_general;


  const HomeState({
    this.usuario_pic = '',
    this.usuario_name = '',
    this.balance_general = 0,
  });

  factory HomeState.fromModel(homeModel model) {
    return HomeState(
      usuario_pic: model.usuario_pic,
      usuario_name: model.usuario_name,
      balance_general: model.balance_general
    );
  }

  HomeState copyWith({
    String? usuario_pic,
    String? usuario_name,
    double? balance_general, required bool isValid,
  }) {
    return HomeState(
      usuario_pic: usuario_pic?? this.usuario_pic,
      usuario_name: usuario_name ?? this.usuario_name,
      balance_general: balance_general ?? this.balance_general
    );
  }

  @override
  List<Object?> get props => [
    usuario_pic,
    usuario_name,
        balance_general
      ];
}
