import 'package:bankingapp/core/presentation/screens/data/domain/entities/beneficioModel.dart';

abstract class BeneficioRepository{
  Future<beneficioModel> loadbeneficioData();
}