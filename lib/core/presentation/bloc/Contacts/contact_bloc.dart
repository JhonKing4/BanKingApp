import 'package:bankingapp/core/presentation/bloc/Contacts/contact_event.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_contact_data.dart' as usecase;
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final usecase.LoadContactsData loadContactsData;

  ContactsBloc(this.loadContactsData) : super(const ContactsState()) {
    on<LoadContactsDataEvent>((event, emit) async {
      try {
        final contactsData = await loadContactsData();
        emit(ContactsState.fromModel(contactsData));
      } catch (error) {
        emit(state.copyWith(
          errorMessage: error.toString(),
          isValid: false,
        ));
      }
    });
  }
}



class RegisterContactBloc extends Bloc<RegisterContactEvent, RegisterContactState> {
  final usecase.SubmitRegisterContact submitContact;

  RegisterContactBloc(this.submitContact) : super(RegisterInitial()) {
    on<SubmitRegisterContactEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        await submitContact(event.register);
        emit(RegisterSuccess());
      } catch (e) {
        emit(RegisterError('Error al enviar el formualrio'));
      }
    });
  }
}
