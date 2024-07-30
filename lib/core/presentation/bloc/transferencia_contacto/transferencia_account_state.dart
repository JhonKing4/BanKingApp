import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:equatable/equatable.dart'; // Asegúrate de importar tu modelo


abstract class TransferenciaAmountState extends Equatable {
  const TransferenciaAmountState();

  @override
  List<Object> get props => [];
}

class TrasferenciaInitial extends TransferenciaAmountState {}

class TrasferenciaLoading extends TransferenciaAmountState {}

class TrasferenciaSuccess extends TransferenciaAmountState {}

class TrasferenciaError extends TransferenciaAmountState {
  final String message;

  const TrasferenciaError(this.message);

  @override
  List<Object> get props => [message];
}
