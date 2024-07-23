
import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_Beneficios/beneficioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/beneficio_repository.dart';
import 'package:flutter/services.dart';

class BeneficioRepositoryImpl implements BeneficioRepository{
  @override
  Future<beneficioModel> loadbeneficioData() async {
    final response = await rootBundle.loadString('assets/beneficios.json');
    final data = json.decode(response);
    print(data);
    return beneficioModel.fromJson(data);
  }
} 