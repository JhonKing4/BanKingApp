import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';

abstract class servicioRepository{
  Future<servicioModel> loadservicioData();
}