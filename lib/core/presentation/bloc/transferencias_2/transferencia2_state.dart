
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia2Model.dart';
import 'package:equatable/equatable.dart';

class Transferencia2State extends Equatable {
  final String contacto_pic;
  final String nombre_contacto;
  final String numero_tarjeta_contacto;
  final String tarjeta_pic;
  final double saldo_tarjeta;
  final String numero_tarjeta;


  

  const Transferencia2State({
    this.contacto_pic = '0',
    this.nombre_contacto = '',
    this.numero_tarjeta_contacto = '',
    this.tarjeta_pic = '',
    this.saldo_tarjeta = 0,
    this.numero_tarjeta = '',
  });
 

  factory Transferencia2State.fromModel(transferencia2Model model) {
    return Transferencia2State(
      contacto_pic: model.contacto_pic,
      nombre_contacto: model.nombre_contacto,
      numero_tarjeta_contacto: model.numero_tarjeta_contacto,
      tarjeta_pic: model.tarjeta_pic,
      saldo_tarjeta: model.saldo_tarjeta,
      numero_tarjeta: model.numero_tarjeta
    );
  }

  Transferencia2State copyWith({
    String? contacto_pic,
    String? nombre_contacto,
    String?  numero_tarjeta_contacto,
    String? tarjeta_pic,
    double? saldo_tarjeta,
    String? numero_tarjeta, required bool isValid
    

  }) {
    return Transferencia2State(
      contacto_pic: contacto_pic ?? this.contacto_pic,
      nombre_contacto: nombre_contacto ?? this.nombre_contacto,
      numero_tarjeta_contacto: numero_tarjeta_contacto ?? this.numero_tarjeta_contacto,
      tarjeta_pic: tarjeta_pic ?? this.tarjeta_pic,
      saldo_tarjeta: saldo_tarjeta ?? this.saldo_tarjeta,
      numero_tarjeta: numero_tarjeta ?? this.numero_tarjeta
    );
  }

  @override
  List<Object?> get props => [
        contacto_pic,
        nombre_contacto,
        numero_tarjeta_contacto,
        tarjeta_pic,
        saldo_tarjeta,
        numero_tarjeta
      ];
}
