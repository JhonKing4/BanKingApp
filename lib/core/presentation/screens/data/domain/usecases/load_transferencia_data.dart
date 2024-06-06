
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_repository.dart';

class LoadTransferenciaData {
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<transferenciaModel> call() async {
    final transferenciaModel = await repository.loadtransferenciaData();
    if (transferenciaModel.balance <= 0) {
      throw Exception("El balance debe ser un número positivo.");
    }
    final validImageExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
    final hasValidImageExtension = validImageExtensions.any((ext) =>
        transferenciaModel.contacto_pic.toLowerCase().endsWith(ext));
    if (transferenciaModel.contacto_pic.isEmpty || !hasValidImageExtension) {
      throw Exception("contacto_pic debe ser una URL válida de una imagen.");
    }
    if (transferenciaModel.nombre_contacto.isEmpty) {
      throw Exception("nombre_contacto no puede estar vacío.");
    }
    if (transferenciaModel.ultima_conexion == null) {
      throw Exception("ultima_conexion debe ser una fecha válida.");
    }
    if (transferenciaModel.estado_conexion != true &&
        transferenciaModel.estado_conexion != false) {
      throw Exception("estado_conexion debe ser true o false.");
    }
    return transferenciaModel;
  }
}