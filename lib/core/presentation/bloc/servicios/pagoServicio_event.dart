import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/pagoServicioModel.dart';
import 'package:equatable/equatable.dart';

abstract class PagoServicioEvent extends Equatable {
  const PagoServicioEvent();

  @override
  List<Object> get props => [];
}

class BotonPagoServicioEvent extends PagoServicioEvent {
  final PagoServicioModel pago;

  const BotonPagoServicioEvent(this.pago);

  @override
  List<Object> get props => [pago];
}