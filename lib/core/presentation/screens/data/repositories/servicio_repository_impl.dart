
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';
import 'package:flutter/services.dart';

class ServicioRepositoryImpl implements ServicioRepository{
  @override
  Future<servicioModel> loadservicioData() async {
    final response = await rootBundle.loadString('assets/servicio.json');
    final data = json.decode(response);
    print(data);
    return servicioModel.fromJson(data);
  }
} 