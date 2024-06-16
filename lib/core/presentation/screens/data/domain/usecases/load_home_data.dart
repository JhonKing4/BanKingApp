
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/home_repository.dart';

class LoadHomeData {
  final HomeRepository repository;

  LoadHomeData(this.repository);

  Future<homeModel> call() async {
    final homeData = await repository.loadhomeData();

    if (homeData.balance_general == Null || homeData.balance_general < 0) {
      throw Exception("balance_general debe ser mayor que 0 y no debe ser null.");
    }
    if (homeData.tarjeta_pic.isEmpty) {
      throw Exception("tarjeta_pic no debe estar vacío.");
    }
    if (homeData.saldo_tarjeta == Null || homeData.saldo_tarjeta < 0) {
      throw Exception("saldo_tarjeta debe ser mayor que 0 y no debe ser null.");
    }
    if (homeData.numero_tarjeta.isEmpty) {
      throw Exception("numero_tarjeta no debe estar vacío.");
    }

    return homeData;
  }
}