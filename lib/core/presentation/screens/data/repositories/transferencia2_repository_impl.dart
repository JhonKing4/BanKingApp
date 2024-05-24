
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/transferencia2_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferencia2Model.dart';
import 'package:flutter/services.dart';

class transferencia2RepositoryImpl implements transferencia2Repository{
  @override
  Future<transferencia2Model> loadtransferencia2Data() async {
    final response = await rootBundle.loadString('assets/transferencia2.json');
    final data = json.decode(response);
    print(data);
    return transferencia2Model.fromJson(data);
  }
} 