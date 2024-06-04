



import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferencia2Model.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia2_repository.dart';

class LoadTransferencia2Data{
  final Transferencia2Repository repository;

  LoadTransferencia2Data(this.repository);

  Future<transferencia2Model> call() async {
    final transferencia2Model = await repository.loadtransferencia2Data();

    if(transferencia2Model.numero_tarjeta_contacto.isEmpty){
      throw Exception("balance cannot be empty");
    }
    if(transferencia2Model.contacto_pic.isEmpty){
      throw Exception("contacto_pic cannot be empty");
    }
    if(transferencia2Model.nombre_contacto.isEmpty){
      throw Exception("nombre_contacto cannot be empty");
    }
     if(transferencia2Model.tarjeta_pic.isEmpty){
      throw Exception("ultima_conexion cannot be empty");
    }
     if(transferencia2Model.saldo_tarjeta <= 0){
      throw Exception("estado_conexion cannot be empty");
    }
     if(transferencia2Model.numero_tarjeta.isEmpty){
      throw Exception("estado_conexion cannot be empty");
    }

    return transferencia2Model;
  }
}