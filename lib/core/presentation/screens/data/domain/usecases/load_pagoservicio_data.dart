


import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/pagoServicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/pagoServicio_repository.dart';

class SubmitPago {
  final PagoServicioRepository repository;

  SubmitPago(this.repository);

  Future<void> call(PagoServicioModel pago) async {
    await repository.submitPago(pago);
  }

  
}