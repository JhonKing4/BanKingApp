
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/tarjetas_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:flutter/services.dart';

class tarjetasRepositoryImpl implements tarjetasRepository{
  @override
  Future<tarjetasModel> loadtarjetasData() async {
    final response = await rootBundle.loadString('assets/tarjetas.json');
    final data = json.decode(response);
    print(data);
    return tarjetasModel.fromJson(data);
  }
} 