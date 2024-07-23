import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';

class LoadServicioData {
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<List<servicioModel>> call() async {
    try {
      final List<servicioModel> servicioData = await repository.loadservicioData();

      for (var servicio in servicioData) {
        if (servicio.id == 0) {
          throw Exception("nombre_servicio no puede estar vacío");
        }

        if (servicio.name.isEmpty) {
          throw Exception("nombre_servicio debe ser un servicio válido");
        }

        if (servicio.status == false) {
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
      'DISNEY +', 'IZZI', 'MERCA...BRE', 'INFONAVIT', 'CFE', 
      'NETFLIX', 'TELMEX', 'MAX', 'DISH', 'TOTALPLAY', 'AXTEL', 'STAR +'
    ];
    return serviciosValidos.contains(nombreServicio);
  }
}
