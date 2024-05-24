import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModelDani.dart';

abstract class transferenciaDaniRepository{
  Future<transferenciaModelDani> loadtransferenciaDaniData();
}