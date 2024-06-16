
import 'package:bankingapp/core/presentation/screens/data/domain/entities/transferenciaModel.dart';
import 'package:equatable/equatable.dart';

class TransferenciaState extends Equatable {
  final double balance;
  final String contacto_pic;
  final String nombre_contacto;
  final String ultima_conexion;
  final bool estado_conexion;


  

  TransferenciaState({
    this.balance = 0,
    this.contacto_pic = '',
    this.nombre_contacto = '',
    this.ultima_conexion = '',
    this.estado_conexion = true,
  });
 

  factory TransferenciaState.fromModel(transferenciaModel model) {
    return TransferenciaState(
      balance: model.balance,
      contacto_pic: model.contacto_pic,
      nombre_contacto: model.nombre_contacto,
      ultima_conexion: model.ultima_conexion,
      estado_conexion: model.estado_conexion
    );
  }

  TransferenciaState copyWith({
    double? balance,
    String? contacto_pic, required bool isValid,
    String? nombre_contacto,
    String?  ultima_conexion,
    bool? estado_conexion
    

  }) {
    return TransferenciaState(
      balance: balance ?? this.balance,
      contacto_pic: contacto_pic ?? this.contacto_pic,
      nombre_contacto: nombre_contacto ?? this.nombre_contacto,
      ultima_conexion: ultima_conexion ?? this.ultima_conexion,
      estado_conexion: estado_conexion ?? this.estado_conexion
    );
  }

  @override
  List<Object?> get props => [
        balance,
        contacto_pic,
        nombre_contacto,
        ultima_conexion,
        estado_conexion
      ];
}
