import 'package:equatable/equatable.dart';

abstract class ServicioEvent extends Equatable {
  const ServicioEvent();

  @override
  List<Object?> get props => [];
}

class LoadServicioDataEvent extends ServicioEvent {}

class ServicioPChanged extends ServicioEvent {
  final String servicio_pic;

  const ServicioPChanged(this.servicio_pic);

  @override
  List<Object?> get props => [servicio_pic];
}

class NombreSChanged extends ServicioEvent {
  final String nombre_servicio;

  const NombreSChanged(this.nombre_servicio);

  @override
  List<Object?> get props => [nombre_servicio];
}



class FormSubmitted extends ServicioEvent {}
