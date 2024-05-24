
import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/beneficio_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/beneficioModel.dart';
import 'package:flutter/services.dart';

class beneficioRepositoryImpl implements beneficioRepository{
  @override
  Future<beneficioModel> loadbeneficioData() async {
    final response = await rootBundle.loadString('assets/beneficios.json');
    final data = json.decode(response);
    print(data);
    return beneficioModel.fromJson(data);
  }
} 