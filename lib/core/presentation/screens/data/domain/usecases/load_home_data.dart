
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/home_repository.dart';

class LoadHomeData{
  final HomeRepository repository;

  LoadHomeData(this.repository);

  Future<homeModel> call() async {
    final homeData = await repository.loadhomeData();

    if(homeData.id_cuenta == 0){
      throw Exception("id_cuenta cannot be empty");
    }
    if(homeData.balance_general <= 0){
      throw Exception("balance_general cannot be empty");
    }
    if(homeData.tarjeta_pic.isEmpty){
      throw Exception("tarjeta_pic cannot be empty");
    }
      if(homeData.saldo_tarjeta <= 0){
      throw Exception("saldo_tarjeta cannot be empty");
    }
    if(homeData.numero_tarjeta.isEmpty){
      throw Exception("numero_tarjeta cannot be empty");
    }
  
    return homeData;
  }
}