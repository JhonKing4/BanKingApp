

import 'package:bankingapp/core/presentation/screens/data/domain/entities/retiroModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/retiro_repository.dart';

class LoadRetiroData {
  final RetiroRepository repository;

  LoadRetiroData(this.repository);

  Future<retiroModel> call() async {
    final retiroModel = await repository.loadretiroData();

    if (retiroModel.tarjeta_pic.isEmpty) {
      throw Exception("tarjeta_pic no puede estar vacio");
    }
    if (retiroModel.balance_tajeta < 0) {
      throw Exception("balance_tajeta debe ser mayor a cero");
    }
    if (retiroModel.numero_tarjeta.isEmpty) {
      throw Exception("numero_tarjeta no puede estar vacio");
    }
    if (!numeroValido(retiroModel.numero_tarjeta)) {
      throw Exception("numero_tarjeta no es un numero de tarjeta valido");
    }

    return retiroModel;
  }

  bool numeroValido(String cardNumber) {
    final RegExp cardExp = RegExp(r'^\d{16}$');
    return cardExp.hasMatch(cardNumber);
  }

  validarFecha(String fecha) {
  // Se verifica si la fecha es vacía
  if (fecha.isEmpty) {
    throw Exception("La fecha del movimiento debe ser una fecha válida");
  }
}
}