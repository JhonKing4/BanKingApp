import 'package:bankingapp/core/presentation/screens/data/domain/entities/retiroModel.dart';

abstract class retiroRepository{
  Future<retiroModel> loadretiroData();
}