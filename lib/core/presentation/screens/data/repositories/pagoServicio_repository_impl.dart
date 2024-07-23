import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/pagoServicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/pagoServicio_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PagoServicioRepositoryImpl implements PagoServicioRepository {
  final Dio _dio;

  PagoServicioRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://apimoviles-production.up.railway.app/',
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<void> submitPago(PagoServicioModel pago) async {
      try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Token no encontrado');
    }
  
      print(pago.toJson());
      await _dio.post('log-services', data: pago.toJson(),options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ));
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexion: $e');
      }
      throw Exception('Error al hacer el registro');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al hacer el registro');
    }
  }
}
