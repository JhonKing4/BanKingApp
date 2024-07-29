import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:equatable/equatable.dart'; // Asegúrate de importar tu modelo aquí

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object?> get props => [];
}

class LoadContactsDataEvent extends ContactsEvent {}

class IdChanged extends ContactsEvent {
  final int id;

  const IdChanged(this.id);

  @override
  List<Object?> get props => [id];
}

class UserIdChanged extends ContactsEvent {
  final int? id_user;

  const UserIdChanged(this.id_user);

  @override
  List<Object?> get props => [id_user];
}

class NicknameChanged extends ContactsEvent {
  final String nickname;

  const NicknameChanged(this.nickname);

  @override
  List<Object?> get props => [nickname];
}

class AccountChanged extends ContactsEvent {
  final String account;

  const AccountChanged(this.account);

  @override
  List<Object?> get props => [account];
}

class ContactsSubmitted extends ContactsEvent {}

//REGISTRO DE CONTACTO

abstract class RegisterContactEvent extends Equatable {
  const RegisterContactEvent();

  @override
  List<Object> get props => [];
}

class SubmitRegisterContactEvent extends RegisterContactEvent {
  final ContactsModel register;

  const SubmitRegisterContactEvent(this.register);

  @override
  List<Object> get props => [register];
}