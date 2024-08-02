
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/account_repository.dart';

class LoadAccountData {
  final AccountRepository repository;

  LoadAccountData(this.repository);

  Future<AccountModel> call() async {
    final accountdata = await repository.getAccountData();

 
    if (accountdata.id_user == null) {
      throw Exception("Error no debe estar vacío.");
    }
    if (accountdata.balance < 0) {
      throw Exception("El balance es negatvio, hubo un problema");
    }
     if (accountdata.status != 0) {
      throw Exception("La cuenta del usuario no esta activa");
    }
     if (accountdata.card.isEmpty) {
      throw Exception("El balance es negatvio, hubo un problema");
    }
     if (accountdata.user == null) {
      throw Exception("Error al traer los datos del usuario");
    }


    return accountdata;
  }
}