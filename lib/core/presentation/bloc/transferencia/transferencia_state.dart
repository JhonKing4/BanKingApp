
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:equatable/equatable.dart';

class TransferenciaState extends Equatable {
  final List<transferenciaModel> transferencias;
  final String errorMessage;
  final bool isValid;

  const TransferenciaState({
    this.transferencias = const [],
    this.errorMessage = '',
    this.isValid = true,
  });

  factory TransferenciaState.fromModel(List<transferenciaModel> models) {
    return TransferenciaState(
      transferencias: models,
    );
  }

  TransferenciaState copyWith({
    List<transferenciaModel>? transferencias,
    String? errorMessage,
    bool? isValid,
  }) {
    return TransferenciaState(
      transferencias: transferencias ?? this.transferencias,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [transferencias, errorMessage, isValid];
}
