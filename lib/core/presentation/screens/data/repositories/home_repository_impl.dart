
import 'dart:convert';


import 'package:bankingapp/core/presentation/screens/data/domain/Repositories/home_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:flutter/services.dart';

class homeRepositoryImpl implements homeRepository{
  @override
  Future<homeModel> loadhomeData() async {
    final response = await rootBundle.loadString('assets/home.json');
    final data = json.decode(response);
    print(data);
    return homeModel.fromJson(data);
  }
} 