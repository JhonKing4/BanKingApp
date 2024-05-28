
// import 'package:bankingapp/core/presentation/screens/data/domain/entities/tarjetasModel.dart';
// import 'package:equatable/equatable.dart';

// class TarjetasState extends Equatable {
//   final double balance;
//   final String contacto_pic;
//   final String nombre_contacto;
//   final DateTime ultima_conexion;
//   final bool estado_conexion;


//   const TarjetasState({
//     this.balance = 0,
//     this.contacto_pic = '',
//     this.nombre_contacto = '',
//     this.ultima_conexion = const DateTime(2023, 5, 27, 10, 30, 0),
//     this.estado_conexion = true,
//   });

//   factory TarjetasState.fromModel(tarjetasModel model) {
//     return TarjetasState(
//       balance: model.balance,
//       contacto_pic: model.contacto_pic,
//       nombre_contacto: model.nombre_contacto,
//       ultima_conexion: model.ultima_conexion,
//       estado_conexion: model.estado_conexion
//     );
//   }

//   TarjetasState copyWith({
//     String? balance,
//     double? contacto_pic, required bool isValid,
//     String? nombre_contacto,

//   }) {
//     return TarjetasState(
//       tarjeta_pic: tarjeta_pic ?? this.tarjeta_pic,
//       saldo_tarjeta: saldo_tarjeta ?? this.saldo_tarjeta,
//       numero_tarjeta: numero_tarjeta ?? this.numero_tarjeta
//     );
//   }

//   @override
//   List<Object?> get props => [
//         tarjeta_pic,
//         saldo_tarjeta,
//         numero_tarjeta
//       ];
// }
