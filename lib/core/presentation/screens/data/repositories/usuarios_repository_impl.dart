import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:dio/dio.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final Dio _dio = Dio();

  @override
  Future<void> submitUser(UsuariosModel register) async {
    try {
      await _dio.post('https://mollusk-safe-openly.ngrok-free.app/users', data: register.toJson());
    } catch (e) {
      print(e);
      throw Exception('Failed to submit Register');
    }
  }
}