
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_tarjetas/tarjetasModel.dart';

abstract class TarjetaRepository {
  Future<List<tarjetasModel>> loadTarjetaData();
}
