// usuarios_usecase.dart

import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';

class RegisterUser {
  final RegisterRepository _repository;

  RegisterUser(this._repository);

  Future<void> call(UsuariosModel user, {
    required String email,
    required String lastname,
    required String name,
    required String password,
    required String phone,
    required String rfc,
  }) async {
    return await _repository.registerUser(user, email: email, lastname: lastname, name: name, password: password, phone: phone, rfc: rfc);
  }
}
