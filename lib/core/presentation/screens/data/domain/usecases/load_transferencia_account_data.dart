import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_account_repository.dart';

class SubmitRegisterTransfer {
  final TransferenciaAccountRepository repository;

  SubmitRegisterTransfer(this.repository);

  Future<void> call(Transferencia_accountModel account) async {
    await repository.submitTransferencia(account);
  }

  
}


class LoadMovimientosData {
  final TransferenciaAccountRepository repository;

  LoadMovimientosData(this.repository);

  Future<List<Transferencia_accountModel>> call() async {
    try {
      final List<Transferencia_accountModel> movimientosData = await repository.loadmovimientosData();

      for (var movimiento in movimientosData) {
        if (movimiento.sender_account == null) {
          throw Exception("Se necesita un enviador");
        }

        if (movimiento.receptor_account== null) {
          throw Exception("Se necesita un receptor");
        }

        if (movimiento.amount == null && movimiento.amount! <= 0) {
          throw Exception("La cantidad no puede ser negativa o igual a 0");
        }
      }

      return movimientosData;
    } catch (e) {
      throw Exception("Error al cargar datos de servicio: $e");
    }
  }
}
