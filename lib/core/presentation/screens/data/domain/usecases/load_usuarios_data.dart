
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';

class LoadUsuarioData {
  final UsuariosRepository repository;

  LoadUsuarioData(this.repository);

  Future<UsuariosModel> call() async {
    final UsuarioData = await repository.loadusuariosData();

    if (UsuarioData.id <= 0) {
      throw Exception("id no puede ser igual o menor a cero");
    }
    if (UsuarioData.name.isEmpty || UsuarioData.name.length > 50) {
      throw Exception("name no puede estar vacio o superar los 50 caracteres");
    }
    if (UsuarioData.lastname.isEmpty || UsuarioData.lastname.length > 50) {
      throw Exception("lastname no puede estar vacio o superar los 50 caracteres");
    }
    if (UsuarioData.email.isEmpty || UsuarioData.email.length > 50) {
      throw Exception("email no puede estar vacio o superar los 50 caracteres");
    }
    if (UsuarioData.rfc.isEmpty || UsuarioData.rfc.length > 50) {
      throw Exception("rfc no puede estar vacio o superar los 50 caracteres");
    }
    if (UsuarioData.phone.isEmpty || UsuarioData.phone.length > 10) {
      throw Exception("phone no puede estar vacio o superar los 10 digitos");
    }
    if (UsuarioData.password.isEmpty || UsuarioData.password.length > 16) {
      throw Exception("password no puede estar vacio o superar los 16 caracteres");
    }
     if (UsuarioData.id_bank <= 0) {
      throw Exception("id_bank no puede ser igual o menor a cero");
    }

    return UsuarioData;
  }
}