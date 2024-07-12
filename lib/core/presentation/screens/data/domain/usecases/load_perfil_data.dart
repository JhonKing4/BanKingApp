
import 'package:bankingapp/core/presentation/screens/data/domain/entities/homeModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/home_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';

class LoadPerfilData {
  final RegisterRepository repository;

  LoadPerfilData(this.repository);

  Future<UsuariosModel> call() async {
    final UserData = await repository.getUserData();

 
    if (UserData.name.isEmpty) {
      throw Exception("tarjeta_pic no debe estar vacío.");
    }
    if (UserData.lastname.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }
     if (UserData.email.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }
     if (UserData.rfc.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }
     if (UserData.phone.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }
     if (UserData.password.isEmpty) {
      throw Exception("El nombre no debe estar vacio");
    }

    return UserData;
  }
}