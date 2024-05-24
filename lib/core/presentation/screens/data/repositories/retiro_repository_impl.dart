
import 'dart:convert';



import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/retiro_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/retiroModel.dart';
import 'package:flutter/services.dart';

class retiroRepositoryImpl implements retiroRepository{
  @override
  Future<retiroModel> loadretiroData() async {
    final response = await rootBundle.loadString('assets/retiro.json');
    final data = json.decode(response);
    print(data);
    return retiroModel.fromJson(data);
  }
} 