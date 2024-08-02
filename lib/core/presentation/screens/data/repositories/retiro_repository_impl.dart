
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_retiros/retiroModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/retiro_repository.dart';
import 'package:flutter/services.dart';

class RetiroRepositoryImpl implements RetiroRepository{
  @override
  Future<retiroModel> loadretiroData() async {
    final response = await rootBundle.loadString('assets/retiro.json');
    final data = json.decode(response);
    print(data);
    return retiroModel.fromJson(data);
  }
} 