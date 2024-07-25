import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:equatable/equatable.dart'; // Asegúrate de importar tu modelo

class ContactsState extends Equatable {
  final List<ContactsModel> contacts; // Lista de contactos
  final String errorMessage; // Mensaje de error, si lo hay
  final bool isValid; // Indica si el estado es válido

  const ContactsState({
    this.contacts = const [],
    this.errorMessage = '',
    this.isValid = true,
  });

  factory ContactsState.fromModel(List<ContactsModel> models) {
    return ContactsState(
      contacts: models,
    );
  }

  ContactsState copyWith({
    List<ContactsModel>? contacts,
    String? errorMessage,
    bool? isValid,
  }) {
    return ContactsState(
      contacts: contacts ?? this.contacts,
      errorMessage: errorMessage ?? this.errorMessage,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object?> get props => [contacts, errorMessage, isValid];
}
