
import 'dart:convert';

import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:flutter/services.dart';

class UsuariosRepositoryImpl implements UsuariosRepository{
  @override
  Future<UsuariosModel> loadusuariosData() async {
    final response = await rootBundle.loadString('/users/users.module');
    final data = json.decode(response);
    print(data);
    return UsuariosModel.fromJson(data);
  }
} 