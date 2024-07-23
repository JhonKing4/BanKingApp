import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_home/homeModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/home_repository.dart';
import 'package:flutter/services.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<homeModel> loadhomeData() async {
    try {
      final response = await rootBundle.loadString('assets/json_data/home.json');
      print("Raw JSON: $response");
      final data = json.decode(response);
      print("Decoded JSON: $data");
      return homeModel.fromJson(data);
    } catch (e) {
      print("Error loading home data: $e");
      rethrow;
    }
  }
}
