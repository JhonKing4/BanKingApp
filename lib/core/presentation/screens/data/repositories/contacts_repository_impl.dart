import 'dart:convert';
import 'package:bankingapp/config/api_config.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/contacs_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactRepositoryImpl implements ContactRepository {
  final Dio _dio;

  ContactRepositoryImpl()
      : _dio = Dio(BaseOptions(
          baseUrl: ApiConfig.Url,
          connectTimeout: const Duration(seconds: 50),
          receiveTimeout: const Duration(seconds: 20),
        ));

  @override
  Future<void> submitContact(ContactsModel contact) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Token no encontrado');
      }

      print(contact.toJson());
      await _dio.post('contacts', data: contact.toJson(), options: Options(
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

  @override
  Future<List<ContactsModel>> getContactData() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('authToken');

      if (token == null) {
        throw Exception('Token no encontrado');
      }

      final response = await _dio.get('contacts', options: Options(
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

        print('Consulta correcta, datos del contacto: $responseData');

        final contactDataJson = responseData['data'] as List<dynamic>;
        if (contactDataJson == null) {
          throw Exception('La petición no trajo la información del contacto');
        }

        // Convertir cada elemento en una instancia de ContactsModel
        List<ContactsModel> contacts = contactDataJson
            .map((json) => ContactsModel.fromJson(json as Map<String, dynamic>))
            .toList();

        return contacts;
      } else {
        throw Exception('Error al traer los datos del contacto: ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print('Error de servidor: ${e.response?.statusCode} - ${e.response?.data}');
      } else {
        print('Error de conexión: $e');
      }
      throw Exception('Error al traer los datos del contacto');
    } catch (e) {
      print('Error inesperado: $e');
      throw Exception('Error al traer los datos del contacto');
    }
  }
}
