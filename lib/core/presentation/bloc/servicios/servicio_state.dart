import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';
import 'package:equatable/equatable.dart';

class ServicioState extends Equatable {
  final List<servicioModel> servicios;
  final String errorMessage;
  final bool isValid;

  const ServicioState({
    this.servicios = const [],
    this.errorMessage = '',
    this.isValid = true,
  });

  factory ServicioState.fromModel(List<servicioModel> models) {
    return ServicioState(
      servicios: models,
    );
  }

  ServicioState copyWith({
    List<servicioModel>? servicios,
    String? errorMessage,
    bool? isValid,
  }) {
    return ServicioState(
      servicios: servicios ?? this.servicios,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [servicios, errorMessage, isValid];
}
