import 'dart:convert';
import 'package:bankingapp/config/api_config.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/contacs_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_account_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferenciaAccountRepositoryImpl implements TransferenciaAccountRepository {
  final Dio _dio;

 TransferenciaAccountRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.Url,
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<void> submitTransferencia(transferencia_accountModel account) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Token no encontrado');
      }

      print(account.toJson());
      await _dio.post('transferences', data: account.toJson(), options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ) );
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexión: $e');
      }
      throw Exception('Error al hacer el registro');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al hacer el registro');
    }
  }

}
