import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';

abstract class tarjetasRepository{
  Future<tarjetasModel> loadtarjetasData();
}