import 'package:bankingapp/core/presentation/screens/data/domain/entities/beneficioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/beneficio_repository.dart';

class LoadBeneficioData{
  final BeneficioRepository repository;

  LoadBeneficioData(this.repository);

  Future<beneficioModel> call() async {
    final beneficioData = await repository.loadbeneficioData();

    if(beneficioData.beneficio_pic.isEmpty){
      throw Exception("beneficio_pic cannot be empty");
    }
    if(beneficioData.nombre_beneficio.isEmpty){
      throw Exception("nombre_beneficio cannot be empty");
    }
    if(beneficioData.tipo_beneficio.isEmpty){
      throw Exception("tipo_beneficio cannot be empty");
    }

    return beneficioData;
  }
}