import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia2Model.dart';

abstract class Transferencia2Repository{
  Future<transferencia2Model> loadtransferencia2Data();
}