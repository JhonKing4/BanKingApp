import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';

abstract class ServicioRepository {
  Future<List<servicioModel>> loadservicioData();
}
