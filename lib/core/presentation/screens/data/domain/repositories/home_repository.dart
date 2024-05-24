import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';

abstract class homeRepository{
  Future<homeModel> loadhomeData();
}