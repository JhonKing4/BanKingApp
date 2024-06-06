
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:equatable/equatable.dart';

class UsuarioState extends Equatable {
  final  int id;
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int id_bank; 


  const UsuarioState({
    this.id = 0,
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.id_bank = 0
  });

  factory UsuarioState.fromModel(UsuariosModel model) {
    return UsuarioState(
      id: model.id,
      name: model.name,
      lastname: model.lastname,
      email: model.email,
      rfc: model.rfc,
      phone: model.phone,
      password: model.password,
      id_bank: model.id_bank
    );
  }

  UsuarioState copyWith({
    int? id,
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    int? id_bank, required bool isValid,
  }) {
    return UsuarioState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      id_bank: id_bank ?? this.id_bank
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
        password,
        id_bank
      ];
}
