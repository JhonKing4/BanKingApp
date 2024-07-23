import 'package:equatable/equatable.dart';

abstract class PagoServicioState extends Equatable {
  const PagoServicioState();

  @override
  List<Object> get props => [];
}

class PagoServicioInitial extends PagoServicioState {}

class PagoServicioLoading extends PagoServicioState {}

class PagoServicioSuccess extends PagoServicioState {}

class PagoServicioError extends PagoServicioState {
  final String message;

  const PagoServicioError(this.message);

  @override
  List<Object> get props => [message];
}