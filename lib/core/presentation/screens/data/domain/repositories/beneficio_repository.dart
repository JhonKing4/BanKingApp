import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_Beneficios/beneficioModel.dart';

abstract class BeneficioRepository{
  Future<beneficioModel> loadbeneficioData();
}