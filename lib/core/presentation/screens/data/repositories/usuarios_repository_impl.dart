import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio;

  RegisterRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: 'https://apimoviles-production.up.railway.app/',
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<void> submitUser(UsuariosModel register) async {
    try {
      print(register.toJson());
      await _dio.post('users', data: register.toJson());
    } on DioError catch (e) {
      if (e.response != null) {
        // Error del servidor
        print('Server error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        // Error de conexión
        print('Connection error: $e');
      }
      throw Exception('Failed to submit Register');
    } catch (e) {
      // Otros errores
      print('Unexpected error: $e');
      throw Exception('Failed to submit Register');
    }
  }

  @override
  Future<String> loginUser(String phone, String password) async {
    try {
      final response = await _dio.post('auth/login', data: {
        "phone": phone,
        "password": password,
      });

      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        print('El token recibido es: ' + token);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);
        return token;
      } else {
        throw Exception('Failed to login: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Server error: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Connection error: $e');
      }
      throw Exception('Failed to login');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('Failed to login');
    }
  }
@override
Future<UsuariosModel> getUserData() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get('users', options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ));

    if (response.statusCode == 200) {
      dynamic responseData = response.data;

      if (responseData is String) {
        // Intenta parsear la respuesta como JSON
        try {
          Map<String, dynamic> jsonMap = jsonDecode(responseData);
          responseData = jsonMap;
        } catch (e) {
          throw Exception('Failed to parse response data as JSON');
        }
      }

      print('Consulta correcta, datos del usuario: $responseData');

      // Parsea los datos a UsuariosModel
      UsuariosModel userData = UsuariosModel.fromJson(responseData);
      return userData;
    } else {
      throw Exception('Failed to fetch user data: ${response.statusMessage}');
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
    } else {
      print('Error de conexión: $e');
    }
    throw Exception('Failed to fetch user data');
  } catch (e) {
    print('Error inesperado: $e');
    throw Exception('Failed to fetch user data');
  }
}


}
