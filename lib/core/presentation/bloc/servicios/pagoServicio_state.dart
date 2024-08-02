import 'package:equatable/equatable.dart';

abstract class PagoServicioState extends Equatable {
  const PagoServicioState();

  @override
  List<Object> get props => [];
}

class PagoServicioInitial extends PagoServicioState {}

class PagoServicioLoading extends PagoServicioState {}

class PagoServicioSuccess extends PagoServicioState {
  final String message;
  final String reference;

  const PagoServicioSuccess(this.message, this.reference);

  @override
  List<Object> get props => [message, reference];
}


class PagoServicioError extends PagoServicioState {
  final String message;

  const PagoServicioError(this.message);

  @override
  List<Object> get props => [message];
}