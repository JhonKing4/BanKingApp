import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';

abstract class AccountRepository {
  Future<AccountModel> getAccountData();
}
