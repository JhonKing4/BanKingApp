
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/tarjetas_repository.dart';

class LoadTarjetaData {
  final TarjetaRepository repository;

  LoadTarjetaData(this.repository);

  Future<List<tarjetasModel>> call() async {
    final tarjetaData = await repository.loadTarjetaData();

    for (var tarjeta in tarjetaData) {
      if (tarjeta.numero_tarjeta.isEmpty) {
        throw Exception("tarjeta_num no puede estar vacío");
      }

      if (!esImagenValida(tarjeta.tarjeta_pic)) {
        throw Exception("tarjeta_pic debe ser una imagen válida");
      }
    }

    return tarjetaData;
  }

  bool esImagenValida(String url) {
    final extensionesValidas = ['jpg', 'jpeg', 'png'];
    final extension = url.split('.').last.toLowerCase();
    return extensionesValidas.contains(extension);
  }
}
