
import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
import 'package:equatable/equatable.dart';

class ServicioState extends Equatable {
  final String servicio_pic;
  final String nombre_servicio;

  const ServicioState({
    this.servicio_pic = '',
    this.nombre_servicio = '',
  });

  factory ServicioState.fromModel(servicioModel model) {
    return ServicioState(
      servicio_pic: model.servicio_pic,
      nombre_servicio: model.nombre_servicio,
    );
  }

  ServicioState copyWith({
    String? servicio_pic,
    String? nombre_servicio, required bool isValid,
  }) {
    return ServicioState(
      servicio_pic: servicio_pic ?? this.servicio_pic,
      nombre_servicio: nombre_servicio ?? this.nombre_servicio,
    );
  }

  @override
  List<Object?> get props => [
        servicio_pic,
        nombre_servicio,
      ];
}
