import 'package:bankingapp/core/presentation/screens/data/domain/entities/beneficioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/beneficio_repository.dart';

class LoadBeneficioData {
  final BeneficioRepository repository;

  LoadBeneficioData(this.repository);

  Future<beneficioModel> call() async {
    final beneficioData = await repository.loadbeneficioData();

    if (beneficioData.nombre_beneficio.isEmpty) {
      throw Exception("nombre_beneficio no puede estar vacio");
    }
    if (beneficioData.beneficio_pic.isNotEmpty && !esImagenValida(beneficioData.beneficio_pic)) {
      throw Exception("beneficio_pic debe ser una imagen valida");
    }
    if (beneficioData.tipo_beneficio.isEmpty) {
      throw Exception("tipo_beneficio no puede estar vacio");
    }

    return beneficioData;
  }

  bool esImagenValida(String url) {
    final validExtensions = ['jpg', 'jpeg', 'png'];
    final extension = url.split('.').last;
    return validExtensions.contains(extension.toLowerCase());
  }
}