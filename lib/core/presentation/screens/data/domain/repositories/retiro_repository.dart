import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_retiros/retiroModel.dart';

abstract class RetiroRepository{
  Future<retiroModel> loadretiroData();
}