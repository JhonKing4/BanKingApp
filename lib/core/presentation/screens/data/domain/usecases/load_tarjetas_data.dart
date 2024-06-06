
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/tarjetas_repository.dart';

class LoadTarjetasData {
  final TarjetasRepository repository;

  LoadTarjetasData(this.repository);

  Future<tarjetasModel> call() async {
    final tarjetasModel = await repository.loadtarjetasData();

    if (tarjetasModel.numero_tarjeta.isNotEmpty) {
      throw Exception("numero_tarjeta no puede estar vacio");
    }
    if (tarjetasModel.saldo_tarjeta < 0) {
      throw Exception("saldo_tarjeta no puede ser null o ser menor a cero");
    }
    if (!esImagenValida(tarjetasModel.tarjeta_pic)) {
      throw Exception("tarjeta_pic debe ser una imagen valida");
    }

    return tarjetasModel;
  }

  bool esImagenValida(String path) {
    final validExtensions = ['jpg', 'jpeg', 'png'];
    final extension = path.split('.').last;
    return validExtensions.contains(extension.toLowerCase());
  }
}