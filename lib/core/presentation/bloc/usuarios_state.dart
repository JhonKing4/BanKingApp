// usuarios_state.dart
import 'package:equatable/equatable.dart';

class UsuarioState extends Equatable {
  final String name;
  final String lastname;
  final String email;
  final String rfc;
  final String phone;
  final String password;
  final int id_bank;
  final bool isValid;

  const UsuarioState({
    this.name = '',
    this.lastname = '',
    this.email = '',
    this.rfc = '',
    this.phone = '',
    this.password = '',
    this.id_bank = 0,
    this.isValid = false,
  });

  UsuarioState copyWith({
    String? name,
    String? lastname,
    String? email,
    String? rfc,
    String? phone,
    String? password,
    int? id_bank,
    bool? isValid,
  }) {
    return UsuarioState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      rfc: rfc ?? this.rfc,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      id_bank: id_bank ?? this.id_bank,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [name, lastname, email, rfc, phone, password, id_bank, isValid];
}
