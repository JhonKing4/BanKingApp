import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:equatable/equatable.dart';

class PerfilState extends Equatable {
  final int? id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;


  const PerfilState({
    this.id = 0,
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
  });

  factory PerfilState.fromModel(UsuariosModel model) {
    return PerfilState(
      id: model.id,
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password
    );
  }

  PerfilState copyWith({
    int? id,
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    required bool isValid,
  }) {
    return PerfilState(
      id: id?? this.id,
      name: name?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc?? this.rfc,
      phone: phone?? this.phone,
      password: password?? this.password
    );
  }

  @override
  List<Object?> get props => [
    id,
    name,
    lastname,
    email,
    rfc,
    phone,
    password
      ];


}
