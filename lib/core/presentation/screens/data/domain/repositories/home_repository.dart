import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';

abstract class HomeRepository{
  Future<homeModel> loadhomeData();
}