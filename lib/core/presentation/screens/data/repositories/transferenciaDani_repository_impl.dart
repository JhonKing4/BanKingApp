
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModelDani.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferenciaDani_repository.dart';

import 'package:flutter/services.dart';

class TransferenciaDaniRepositoryImpl implements TransferenciaDaniRepository{
  @override
  Future<transferenciaModelDani> loadtransferenciaDaniData() async {
    final response = await rootBundle.loadString('assets/transferenciaDANI.json');
    final data = json.decode(response);
    print(data);
    return transferenciaModelDani.fromJson(data);
  }
} 