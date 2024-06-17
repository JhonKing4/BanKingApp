import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';

class LoadServicioData {
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<List<servicioModel>> call() async {
    try {
      final List<servicioModel> servicioData = await repository.loadservicioData();

      for (var servicio in servicioData) {
        if (servicio.nombre_servicio.isEmpty) {
          throw Exception("nombre_servicio no puede estar vacío");
        }

        if (!esServicioValido(servicio.nombre_servicio)) {
          throw Exception("nombre_servicio debe ser un servicio válido");
        }

        if (servicio.servicio_pic.isNotEmpty && !esImagenValida(servicio.servicio_pic)) {
          throw Exception("servicio_pic debe ser una imagen válida");
        }
      }

      return servicioData;
    } catch (e) {
      throw Exception("Error al cargar datos de servicio: $e");
    }
  }

  bool esServicioValido(String nombreServicio) {
    const serviciosValidos = [
      'DISNEY +', 'IZZI', 'MERCADO LIBRE', 'INFONAVIT', 'CFE', 
      'NETFLIX', 'TELMEX', 'MAX', 'DISH', 'TOTALPLAY', 'AXTEL', 'STAR +'
    ];
    return serviciosValidos.contains(nombreServicio);
  }

  bool esImagenValida(String url) {
    final extensionesValidas = ['jpg', 'jpeg', 'png'];
    final extension = url.split('.').last.toLowerCase();
    return extensionesValidas.contains(extension);
  }
}
