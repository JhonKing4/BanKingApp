
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/transferencia_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:flutter/services.dart';

class transferenciaRepositoryImpl implements transferenciaRepository{
  @override
  Future<transferenciaModel> loadtransferenciaData() async {
    final response = await rootBundle.loadString('assets/transferencia.json');
    final data = json.decode(response);
    print(data);
    return transferenciaModel.fromJson(data);
  }
} 