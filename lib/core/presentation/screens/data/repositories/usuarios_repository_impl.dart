// register_repository_impl.dart

import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:dio/dio.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio;

  RegisterRepositoryImpl(this._dio);

  @override
  Future<void> registerUser(UsuariosModel user, {
    required String email,
    required String lastname,
    required String name,
    required String password,
    required String phone,
    required String rfc,
  }) async {
    try {
      final response = await _dio.post(
        'https://mollusk-safe-openly.ngrok-free.app/',
        data: {
          'name': name,
          'lastname': lastname,
          'email': email,
          'rfc': rfc,
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        print('Usuario registrado exitosamente');
      } else {
        throw Exception('Error en la llamada API: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en el registro: $e');
      throw Exception('Error en el registro: $e');
    }
  }
}
