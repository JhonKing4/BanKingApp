
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/home_repository.dart';

class LoadHomeData {
  final HomeRepository repository;

  LoadHomeData(this.repository);

  Future<homeModel> call() async {
    final homeData = await repository.loadhomeData();

 
    if (homeData.usuario_pic.isEmpty) {
      throw Exception("tarjeta_pic no debe estar vacío.");
    }
    if (homeData.usuario_name.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }
       if (homeData.balance_general == Null || homeData.balance_general < 0) {
      throw Exception("balance_general debe ser mayor que 0 y no debe ser null.");
    }

    return homeData;
  }
}