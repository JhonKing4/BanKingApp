
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';

abstract class UsuariosRepository{
  Future<UsuariosModel> loadusuariosData();
}