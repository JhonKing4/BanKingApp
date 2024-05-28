
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
//     this.ultima_conexion = ,
//     this.estado_conexion = true,
//   });

//   factory TarjetasState.fromModel(tarjetasModel model) {
//     return TarjetasState(
//       tarjeta_pic: model.tarjeta_pic,
//       saldo_tarjeta: model.saldo_tarjeta,
//       numero_tarjeta: model.numero_tarjeta
//     );
//   }

//   TarjetasState copyWith({
//     String? tarjeta_pic,
//     double? saldo_tarjeta, required bool isValid,
//     String? numero_tarjeta,
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
