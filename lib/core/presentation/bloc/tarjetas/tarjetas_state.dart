
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_tarjetas/tarjetasModel.dart';
import 'package:equatable/equatable.dart';

class TarjetasState extends Equatable {
  final List<tarjetasModel> tarjetas;
  final String errorMessage;
  final bool isValid;

  const TarjetasState({
    this.tarjetas = const [],
    this.errorMessage = '',
    this.isValid = true,
  });

  factory TarjetasState.fromModel(List<tarjetasModel> models) {
    return TarjetasState(
      tarjetas: models,
    );
  }

  TarjetasState copyWith({
    List<tarjetasModel>? servicios,
    String? errorMessage,
    bool? isValid,
  }) {
    return TarjetasState(
      tarjetas: servicios ?? this.tarjetas,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [tarjetas, errorMessage, isValid];
}
