import 'dart:convert';
import 'package:bankingapp/config/api_config.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/contacs_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_account_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TransferenciaAccountRepositoryImpl
    implements TransferenciaAccountRepository {
  final Dio _dio;

  TransferenciaAccountRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.Url,
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<void> submitTransferencia(Transferencia_accountModel account) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Token no encontrado');
      }

      await _dio.post(
        'transferences',
        data: account.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
    } on DioError catch (e) {
      String errorMessage = 'Error al hacer la transferencia';

      if (e.response != null && e.response?.data != null) {
        errorMessage = e.response!.data['message'] ?? errorMessage;
        if (errorMessage == 'No account associated to receptor') {
          errorMessage = 'La cuenta del asociado no existe';
        }
      } else {
        print('Error de conexión: $e');
      }

      print('Error de servidor: ${e.response?.statusCode} - $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al hacer la transferencia');
    }
  }


//PARA OBTENER LOS MOVIMIENTOS


@override
Future<List<Transferencia_accountModel>> loadmovimientosData() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('authToken');

    if (token == null) {
      throw Exception('Token not found');
    }

    final response = await _dio.get('/transferences', options: Options(
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

      print('Consulta correcta, datos de los movimientos: $responseData');

      // Verifica que la respuesta contenga la clave 'data'
      if (responseData is Map<String, dynamic> && responseData.containsKey('data')) {
        // Extrae la lista de la clave 'data'
        var dataList = responseData['data'];

        // Asegúrate de que dataList sea una lista
        if (dataList is List) {
          List<Transferencia_accountModel> data = dataList
              .map((json) => Transferencia_accountModel.fromJson(json))
              .toList();
          return data.reversed.toList();
        } else {
          throw Exception('La clave "data" no contiene una lista');
        }
      } else {
        throw Exception('La respuesta no contiene la clave "data"');
      }
    } else {
      throw Exception('Error al traer los datos de  los movimientos: ${response.statusMessage}');
    }
  } on DioError catch (e) {
    if (e.response != null) {
      print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
    } else {
      print('Error de conexión: $e');
    }
    throw Exception('Error al traer los datos de los movimientos');
  } catch (e) {
    print('Error inesperado: $e');
    throw Exception('Error al traer los datos de los movimientos');
  }
}



}
