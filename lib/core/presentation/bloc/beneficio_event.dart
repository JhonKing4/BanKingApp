import 'package:equatable/equatable.dart';

abstract class BeneficioEvent extends Equatable {
  const BeneficioEvent();

  @override
  List<Object?> get props => [];
}

class LoadFormDataEvent extends BeneficioEvent {}

class PicChanged extends BeneficioEvent {
  final String beneficio_pic;

  const PicChanged(this.beneficio_pic);

  @override
  List<Object?> get props => [beneficio_pic];
}

class NombreBChanged extends BeneficioEvent {
  final String nombre_beneficio;

  const NombreBChanged(this.nombre_beneficio);

  @override
  List<Object?> get props => [nombre_beneficio];
}

class TipoBChanged extends BeneficioEvent {
  final String tipo_beneficio;

  const TipoBChanged(this.tipo_beneficio);

  @override
  List<Object?> get props => [tipo_beneficio];
}


class FormSubmitted extends BeneficioEvent {}
