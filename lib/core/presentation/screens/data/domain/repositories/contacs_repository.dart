import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';

abstract class ContactRepository {
  Future<void> submitContact(ContactsModel contact);
  Future<List<ContactsModel>> getContactData();
}





