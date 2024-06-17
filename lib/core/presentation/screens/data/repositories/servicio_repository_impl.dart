

import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';
import 'package:flutter/services.dart';

class ServicioRepositoryImpl implements ServicioRepository {
  @override
  Future<List<servicioModel>> loadservicioData() async {
    final response = await rootBundle.loadString('assets/json_data/servicios.json');
    final List<dynamic> data = json.decode(response);
    print(data);
    return servicioModel.listFromJson(data);
  }
}
