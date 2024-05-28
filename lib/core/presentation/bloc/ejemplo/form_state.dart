// import 'package:equatable/equatable.dart';
// import 'package:aplicaciones_moviles_app/domain/models/form_model.dart';

// class FormState extends Equatable {
//   final String name;
//   final String surname;
//   final String email;
//   final String phone;
//   final DateTime? birthDate;
//   final String country;
//   final String rfc;
//   final bool termsAccepted;
//   final bool isValid;

//   const FormState({
//     this.name = '',
//     this.surname = '',
//     this.email = '',
//     this.phone = '',
//     this.birthDate,
//     this.country = '',
//     this.rfc = '',
//     this.termsAccepted = false,
//     this.isValid = false,
//   });

//   factory FormState.fromModel(FormModel model) {
//     return FormState(
//       name: model.name,
//       surname: model.surname,
//       email: model.email,
//       phone: model.phone,
//       birthDate: model.birthDate,
//       country: model.country,
//       rfc: model.rfc,
//       termsAccepted: model.termsAccepted,
//       isValid: true,
//     );
//   }

//   FormState copyWith({
//     String? name,
//     String? surname,
//     String? email,
//     String? phone,
//     DateTime? birthDate,
//     String? country,
//     String? rfc,
//     bool? termsAccepted,
//     bool? isValid,
//   }) {
//     return FormState(
//       name: name ?? this.name,
//       surname: surname ?? this.surname,
//       email: email ?? this.email,
//       phone: phone ?? this.phone,
//       birthDate: birthDate ?? this.birthDate,
//       country: country ?? this.country,
//       rfc: rfc ?? this.rfc,
//       termsAccepted: termsAccepted ?? this.termsAccepted,
//       isValid: isValid ?? this.isValid,
//     );
//   }

//   @override
//   List<Object?> get props => [
//         name,
//         surname,
//         email,
//         phone,
//         birthDate,
//         country,
//         rfc,
//         termsAccepted,
//         isValid,
//       ];
// }
