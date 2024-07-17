
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';

abstract class TarjetaRepository {
  Future<List<tarjetasModel>> loadTarjetaData();
}
