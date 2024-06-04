import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';

abstract class TarjetasRepository{
  Future<tarjetasModel> loadtarjetasData();
}