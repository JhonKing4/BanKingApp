import 'dart:convert';

import 'package:bankingapp/config/api_config.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/account_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountRepositoryImpl implements AccountRepository {
  final Dio _dio;

  AccountRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.Url,
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));


 @override
Future<AccountModel> getAccountData() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Token no encontrado');
    }

    final response = await _dio.get('accounts/me', options: Options(
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
      final accountDataJson = responseData['data'];
      if (accountDataJson == null) {
        throw Exception('La petición no trajo la informacion del usuario');
      }

      AccountModel accountData = AccountModel.fromJson(accountDataJson);
      return accountData;
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


}
