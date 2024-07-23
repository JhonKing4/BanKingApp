
import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferenciaModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_repository.dart';
import 'package:flutter/services.dart';

class TransferenciaRepositoryImpl implements TransferenciaRepository{
  @override
  Future<List<transferenciaModel>> loadtransferenciaData() async {
    final response = await rootBundle.loadString('assets/json_data/transferencia.json');
    final List<dynamic> data = json.decode(response);
    print(data);
    return transferenciaModel.listFromJson(data);
  }
} 