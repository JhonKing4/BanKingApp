import 'dart:convert';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/tarjetas_repository.dart';
import 'package:flutter/services.dart';

class TarjetaRepositoryImpl implements TarjetaRepository {
  @override
  Future<List<tarjetasModel>> loadTarjetaData() async {
      final response = await rootBundle.loadString('assets/json_data/tarjetas.json');
      final List<dynamic> data = json.decode(response);
       print(data);
       return tarjetasModel.listFromJson(data);
  }
}
