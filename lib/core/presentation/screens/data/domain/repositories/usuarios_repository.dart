import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';

abstract class RegisterRepository {
  Future<void> submitUser(UsuariosModel user);
}