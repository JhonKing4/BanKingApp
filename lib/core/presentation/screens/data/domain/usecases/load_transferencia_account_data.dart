import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_account_repository.dart';

class SubmitRegisterTransfer {
  final TransferenciaAccountRepository repository;

  SubmitRegisterTransfer(this.repository);

  Future<void> call(Transferencia_accountModel account) async {
    await repository.submitTransferencia(account);
  }

  
}


