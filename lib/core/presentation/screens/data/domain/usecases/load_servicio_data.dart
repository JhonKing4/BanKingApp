
import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';

class LoadServicioData {
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<servicioModel> call() async {
    final servicioModel = await repository.loadservicioData();

    if (servicioModel.nombre_servicio.isEmpty) {
      throw Exception("nombre_servicio no puede estar vacio");
    }

    if (!esServicioValido(servicioModel.nombre_servicio)) {
      throw Exception("nombre_servicio debe ser un servicio valido");
    }

    if (servicioModel.servicio_pic.isNotEmpty && !esImagenValida(servicioModel.servicio_pic)) {
      throw Exception("servicio_pic debe ser una imagen valida");
    }

    return servicioModel;
  }

  bool esServicioValido(String nombreServicio) {
    const serviciosValidos = ['DISNEY +', 'IZZI', 'MERCADO LIBRE', 'INFONAVIT', 'CFE', 
    'NETFLIX', 'TELMEX', 'MAX', 'DISH', 'TOTALPLAY','AXTEL', 'STAR +'];
    return serviciosValidos.contains(nombreServicio);
  }

  bool esImagenValida(String url) {
    final extensionesValidas = ['jpg', 'jpeg', 'png'];
    final extension = url.split('.').last.toLowerCase();
    return extensionesValidas.contains(extension);
  }
}