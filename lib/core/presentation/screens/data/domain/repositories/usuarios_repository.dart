import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';

abstract class RegisterRepository {
  Future<void> submitUser(UsuariosModel user);
  Future<String> loginUser(String phone, String password);
  Future<UsuariosModel> getUserData();
  Future<void> updateUser(UsuariosModel user);
}
