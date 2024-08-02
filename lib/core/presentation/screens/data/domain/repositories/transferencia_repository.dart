import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferenciaModel.dart';

abstract class TransferenciaRepository{
  Future<List<transferenciaModel>> loadtransferenciaData();
}