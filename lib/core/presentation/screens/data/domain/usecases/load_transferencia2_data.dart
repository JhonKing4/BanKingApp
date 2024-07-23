



import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia2Model.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/transferencia2_repository.dart';

class LoadTransferencia2Data {
  final Transferencia2Repository repository;

  LoadTransferencia2Data(this.repository);

  Future<transferencia2Model> call() async {
    final transferencia2Model = await repository.loadtransferencia2Data();

    if (transferencia2Model.saldo_tarjeta <= 0) {
      throw Exception("El saldo de la tarjeta debe ser un número positivo.");
    }
    if (transferencia2Model.nombre_contacto.isEmpty) {
      throw Exception("El nombre de contacto no puede estar vacío.");
    }
    if (transferencia2Model.tarjeta_pic.isNotEmpty && !esImagenValida(transferencia2Model.tarjeta_pic)) {
      throw Exception("La imagen de la tarjeta no es válida.");
    }
    if (transferencia2Model.nombre_contacto.isEmpty) {
      throw Exception("El nombre de la tarjeta no puede estar vacío.");
    }
    if (transferencia2Model.numero_tarjeta_contacto.isEmpty) {
      throw Exception("El número de tarjeta de contacto no puede estar vacío.");
    }
    if (!numeroValido(transferencia2Model.numero_tarjeta_contacto)) {
      throw Exception("El número de tarjeta de contacto no es válido.");
    }

    if (transferencia2Model.contacto_pic.isNotEmpty && !esImagenValida(transferencia2Model.contacto_pic)) {
      throw Exception("La imagen de contacto no es válida.");
    }

    return transferencia2Model;
  }
  bool esImagenValida(String url) {
    final imageExtensions = ['jpg', 'jpeg', 'png'];
    final extension = url.split('.').last.toLowerCase();
    return imageExtensions.contains(extension);
  }
  bool numeroValido(String cardNumber) {
    return cardNumber.length == 16 && cardNumber.runes.every((int rune) {
      var char = String.fromCharCode(rune);
      return char.contains(RegExp(r'[0-9]'));
    });
  }
}