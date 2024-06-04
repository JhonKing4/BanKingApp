import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModelDani.dart';

abstract class TransferenciaDaniRepository{
  Future<transferenciaModelDani> loadtransferenciaDaniData();
}