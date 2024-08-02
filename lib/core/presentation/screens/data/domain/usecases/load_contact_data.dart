import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/contacs_repository.dart';

class LoadContactsData {
  final ContactRepository repository;

  LoadContactsData(this.repository);

  Future<List<ContactsModel>> call() async {
    try {
      final List<ContactsModel> contactsData = await repository.getContactData();
      for (var contact in contactsData) {
        if (contact.nickname.isEmpty) {
          throw Exception("El nickname no puede estar vacío.");
        }
        if (contact.account.isEmpty) {
          throw Exception("La cuenta no puede estar vacía.");
        }
        // Aquí puedes agregar más validaciones según sea necesario
      }

      return contactsData;
    } catch (e) {
      throw Exception("Error al cargar datos de contactos: $e");
    }
  }
}



class SubmitRegisterContact {
  final ContactRepository repository;

  SubmitRegisterContact(this.repository);

  Future<void> call(ContactsModel register) async {
    await repository.submitContact(register);
  }

  
}