import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_home/homeModel.dart';

abstract class HomeRepository{
  Future<homeModel> loadhomeData();
}