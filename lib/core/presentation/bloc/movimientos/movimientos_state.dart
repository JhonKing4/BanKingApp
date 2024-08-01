import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:equatable/equatable.dart';

class MovimientosState extends Equatable {
  final List<Transferencia_accountModel> movimientos;
  final String errorMessage;
  final bool isValid;

  const MovimientosState({
    this.movimientos = const [],
    this.errorMessage = '',
    this.isValid = true,
  });

  factory MovimientosState.fromModel(List<Transferencia_accountModel> models) {
    return MovimientosState(
      movimientos: models,
    );
  }

  MovimientosState copyWith({
    List<Transferencia_accountModel>? movimientos,
    String? errorMessage,
    bool? isValid,
  }) {
    return MovimientosState(
      movimientos: movimientos ?? this.movimientos,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [movimientos, errorMessage, isValid];
}
