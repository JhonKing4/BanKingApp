import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/pagoServicioModel.dart';

abstract class PagoServicioRepository {
  Future<void> submitPago(PagoServicioModel pago);
}
