
import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/transferenciaDani_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModelDani.dart';

import 'package:flutter/services.dart';

class transferenciaDaniRepositoryImpl implements transferenciaDaniRepository{
  @override
  Future<transferenciaModelDani> loadtransferenciaDaniData() async {
    final response = await rootBundle.loadString('assets/transferenciaDANI.json');
    final data = json.decode(response);
    print(data);
    return transferenciaModelDani.fromJson(data);
  }
} 