// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:aplicaciones_moviles_app/domain/usecases/load_form_data.dart' as usecase;
// import 'package:aplicaciones_moviles_app/presentation/bloc/form_event.dart';
// import 'package:aplicaciones_moviles_app/presentation/bloc/form_state.dart';

// class FormBloc extends Bloc<FormEvent, FormState> {
//   final usecase.LoadFormData loadFormData;

//   FormBloc(this.loadFormData) : super(const FormState()) {
//     on<LoadFormDataEvent>((event, emit) async {
//       final formData = await loadFormData();
//       emit(FormState.fromModel(formData));
//     });

//     on<NameChanged>((event, emit) {
//       emit(state.copyWith(name: event.name, isValid: _validateForm()));
//     });
//     on<SurnameChanged>((event, emit) {
//       emit(state.copyWith(surname: event.surname, isValid: _validateForm()));
//     });
//     on<EmailChanged>((event, emit) {
//       emit(state.copyWith(email: event.email, isValid: _validateForm()));
//     });
//     on<PhoneChanged>((event, emit) {
//       emit(state.copyWith(phone: event.phone, isValid: _validateForm()));
//     });
//     on<BirthDateChanged>((event, emit) {
//       emit(state.copyWith(birthDate: event.birthDate, isValid: _validateForm()));
//     });
//     on<CountryChanged>((event, emit) {
//       emit(state.copyWith(country: event.country, isValid: _validateForm()));
//     });
//     on<RfcChanged>((event, emit) {
//       emit(state.copyWith(rfc: event.rfc, isValid: _validateForm()));
//     });
//     on<TermsAcceptedChanged>((event, emit) {
//       emit(state.copyWith(termsAccepted: event.termsAccepted, isValid: _validateForm()));
//     });
//     on<FormSubmitted>((event, emit) {
//       if (state.isValid) {
//         // Handle form submission logic
//       }
//     });
//   }

//   bool _validateForm() {
//     return state.name.isNotEmpty &&
//         state.surname.isNotEmpty &&
//         state.email.isNotEmpty &&
//         state.phone.isNotEmpty &&
//         state.birthDate != null &&
//         state.country.isNotEmpty &&
//         state.rfc.isNotEmpty &&
//         state.termsAccepted;
//   }
// }
