import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';

abstract class TransferenciaRepository{
  Future<List<transferenciaModel>> loadtransferenciaData();
}