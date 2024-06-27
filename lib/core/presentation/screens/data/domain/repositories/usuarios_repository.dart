// register_repository.dart

import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';

abstract class RegisterRepository {
  Future<void> registerUser(UsuariosModel user, {
     required String name,
      required String lastname,
    required String email,
       required String rfc,
    required String password,
    required String phone,
 
  });
}
