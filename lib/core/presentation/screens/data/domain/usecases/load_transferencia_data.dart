

import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia_repository.dart';

class LoadTransferenciaData{
  final TransferenciaRepository repository;

  LoadTransferenciaData(this.repository);

  Future<transferenciaModel> call() async {
    final transferenciaModel = await repository.loadtransferenciaData();

    if(transferenciaModel.balance <= 0){
      throw Exception("balance cannot be empty");
    }
    if(transferenciaModel.contacto_pic.isEmpty){
      throw Exception("contacto_pic cannot be empty");
    }
    if(transferenciaModel.nombre_contacto.isEmpty){
      throw Exception("nombre_contacto cannot be empty");
    }
     if(transferenciaModel.ultima_conexion == ''){
      throw Exception("ultima_conexion cannot be empty");
    }
     if(transferenciaModel.estado_conexion == ''){
      throw Exception("estado_conexion cannot be empty");
    }

    return transferenciaModel;
  }
}