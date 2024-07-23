import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_Beneficios/beneficioModel.dart';
import 'package:equatable/equatable.dart';

class BeneficioState extends Equatable {
  final String beneficio_pic;
  final String nombre_beneficio;
  final String tipo_beneficio;

  const BeneficioState({
    this.beneficio_pic = '',
    this.nombre_beneficio = '',
    this.tipo_beneficio = '',
  });

  factory BeneficioState.fromModel(beneficioModel model) {
    return BeneficioState(
      beneficio_pic: model.beneficio_pic,
      nombre_beneficio: model.nombre_beneficio,
      tipo_beneficio: model.tipo_beneficio,
    );
  }

  BeneficioState copyWith({
    String? beneficio_pic,
    String? nombre_beneficio,
    String? tipo_beneficio, required bool isValid,
  }) {
    return BeneficioState(
      beneficio_pic: beneficio_pic ?? this.beneficio_pic,
      nombre_beneficio: nombre_beneficio ?? this.nombre_beneficio,
      tipo_beneficio: tipo_beneficio ?? this.tipo_beneficio,
    );
  }

  @override
  List<Object?> get props => [
        beneficio_pic,
        nombre_beneficio,
        tipo_beneficio,
      ];
}
