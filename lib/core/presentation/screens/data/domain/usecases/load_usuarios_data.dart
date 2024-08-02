import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';


class SubmitRegister {
  final RegisterRepository repository;

  SubmitRegister(this.repository);

  Future<void> call(UsuariosModel register) async {
    await repository.submitUser(register);
  }

  
}