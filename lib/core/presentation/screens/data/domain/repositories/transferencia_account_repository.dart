import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';

abstract class TransferenciaAccountRepository {
  Future<void> submitTransferencia(transferencia_accountModel account);
}





