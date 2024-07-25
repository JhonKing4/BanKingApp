import 'dart:convert';

import 'package:bankingapp/config/api_config.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio;

  RegisterRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.Url,
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
        throw Exception('Error al hacer login: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexion: $e');
      }
      throw Exception('Error al hacer login');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al hacer login');
    }
  }

 @override
Future<UsuariosModel> getUserData() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Token no encontrado');
    }

    final response = await _dio.get('users', options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    ));

    if (response.statusCode == 200) {
      dynamic responseData = response.data;

      if (responseData is String) {
        try {
          Map<String, dynamic> jsonMap = jsonDecode(responseData);
          responseData = jsonMap;
        } catch (e) {
          throw Exception('Error al convertir el JSON');
        }
      }

      print('Consulta correcta, datos del usuario: $responseData');
      final userDataJson = responseData['data'];
      if (userDataJson == null) {
        throw Exception('La petición no trajo la informacion del usuario');
      }

      UsuariosModel userData = UsuariosModel.fromJson(userDataJson);
      return userData;
    } else {
      throw Exception('Error al trar los datos de usuario: ${response.statusMessage}');
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
    } else {
      print('Error de conexión: $e');
    }
    throw Exception('Error al trar los datos de usuario');
  } catch (e) {
    print('Error inesperado: $e');
    throw Exception('Error al trar los datos de usuario');
  }
}


  @override
  Future<void> updateUser(UsuariosModel user) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('El token no existe');
      }

      final response = await _dio.patch('users', 
        data: user.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Usuario actualizado correctamente: ${response.data}');
      } else {
        throw Exception('Error al actualizar los datos del usuario: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexión: $e');
      }
      throw Exception('Error al actualizar los datos del usuario');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al actualizar los datos del usuario');
    }
  }
}
