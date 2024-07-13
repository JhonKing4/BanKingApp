import 'package:equatable/equatable.dart';

abstract class PerfilUState extends Equatable {
  const PerfilUState();

  @override
  List<Object> get props => [];
}

class PerfilUInitial extends PerfilUState {}

class PerfilULoading extends PerfilUState {}

class PerfilUSuccess extends PerfilUState {
  final String message;

  const PerfilUSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class PerfilUFailure extends PerfilUState {
  final String message;

  const PerfilUFailure(this.message);

  @override
  List<Object> get props => [message];
}
