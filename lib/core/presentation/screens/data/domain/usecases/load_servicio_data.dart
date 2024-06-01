
import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';

class LoadServicioData{
  final ServicioRepository repository;

  LoadServicioData(this.repository);

  Future<servicioModel> call() async {
    final servicioModel = await repository.loadservicioData();

    if(servicioModel.servicio_pic.isEmpty){
      throw Exception("servicio_pic cannot be empty");
    }
    if(servicioModel.nombre_servicio.isEmpty){
      throw Exception("nombre_servicio cannot be empty");
    }

    return servicioModel;
  }
}