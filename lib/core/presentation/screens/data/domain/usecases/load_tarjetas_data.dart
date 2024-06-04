
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/tarjetas_repository.dart';

class LoadTarjetasData{
  final TarjetasRepository repository;

  LoadTarjetasData(this.repository);

  Future<tarjetasModel> call() async {
    final tarjetasModel = await repository.loadtarjetasData();

    if(tarjetasModel.tarjeta_pic.isEmpty){
      throw Exception("tarjeta_pic cannot be empty");
    }
    if(tarjetasModel.saldo_tarjeta <= 0){
      throw Exception("saldo_tarjeta cannot be empty");
    }
    if(tarjetasModel.numero_tarjeta.isEmpty){
      throw Exception("numero_tarjetao cannot be empty");
    }

    return tarjetasModel;
  }
}