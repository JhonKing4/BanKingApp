import 'dart:convert';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/servicio_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicioRepositoryImpl implements ServicioRepository {
  final Dio _dio;

  ServicioRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://apimoviles-production.up.railway.app/',
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<List<servicioModel>> loadservicioData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Token not found');
      }

      final response = await _dio.get('services', options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ));

      if (response.statusCode == 200) {
        dynamic responseData = response.data;

        if (responseData is String) {
          try {
            responseData = jsonDecode(responseData);
          } catch (e) {
            throw Exception('Error al convertir el JSON');
          }
        }

        print('Consulta correcta, datos de los servicios: $responseData');

        // Asegúrate de que responseData sea una lista
        if (responseData is List) {
          List<servicioModel> data = responseData.map((json) => servicioModel.fromJson(json)).toList();
          return data;
        } else {
          throw Exception('La petición no trajo una lista de servicios');
        }
      } else {
        throw Exception('Error al traer los datos de usuario: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexión: $e');
      }
      throw Exception('Error al traer los datos de usuario');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al traer los datos de usuario');
    }
  }
}