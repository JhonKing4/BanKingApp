

import 'package:bankingapp/core/presentation/screens/data/domain/entities/retiroModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/retiro_repository.dart';

class LoadRetiroData{
  final RetiroRepository repository;

  LoadRetiroData(this.repository);

  Future<retiroModel> call() async {
    final retiroModel = await repository.loadretiroData();

    if(retiroModel.tarjeta_pic.isEmpty){
      throw Exception("tarjeta_pic cannot be empty");
    }
    if(retiroModel.balance_tajeta <= 0){
      throw Exception("balance_tajeta cannot be empty");
    }
    if(retiroModel.numero_tarjeta.isEmpty){
      throw Exception("numero_tarjeta cannot be empty");
    }

    return retiroModel;
  }
}