
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_repository.dart';

class LoadTransferenciaData {
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<List<transferenciaModel>> call() async {

    try {

  final List<transferenciaModel> transferenciaData = await repository.loadtransferenciaData();

            for (var trasferencia in transferenciaData) {
            final validImageExtensions = ['.jpg', '.jpeg', '.png', '.gif'];
            final hasValidImageExtension = validImageExtensions.any((ext) =>
        trasferencia .contacto_pic.toLowerCase().endsWith(ext));
    if (trasferencia .contacto_pic.isEmpty || !hasValidImageExtension) {
      throw Exception("contacto_pic debe ser una URL válida de una imagen.");
    }
    if (trasferencia .nombre_contacto.isEmpty) {
      throw Exception("nombre_contacto no puede estar vacío.");
    }
    if (trasferencia .ultima_conexion == null) {
      throw Exception("ultima_conexion debe ser una fecha válida.");
    }
    if (trasferencia .estado_conexion != true &&
        trasferencia .estado_conexion != false) {
      throw Exception("estado_conexion debe ser true o false.");
    }
            }
       return transferenciaData;
    } catch (e) {
      throw Exception("Error al cargar datos de servicio: $e");
    }
  }
}