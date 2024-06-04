import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferencia2Model.dart';

abstract class Transferencia2Repository{
  Future<transferencia2Model> loadtransferencia2Data();
}