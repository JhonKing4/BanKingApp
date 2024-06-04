import 'package:bankingapp/core/presentation/screens/data/domain/entities/retiroModel.dart';

abstract class RetiroRepository{
  Future<retiroModel> loadretiroData();
}