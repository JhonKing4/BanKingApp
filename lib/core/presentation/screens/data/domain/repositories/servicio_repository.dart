import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';

abstract class ServicioRepository{
  Future<servicioModel> loadservicioData();
}