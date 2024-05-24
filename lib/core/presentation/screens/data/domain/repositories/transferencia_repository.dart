import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';

abstract class transferenciaRepository{
  Future<transferenciaModel> loadtransferenciaData();
}