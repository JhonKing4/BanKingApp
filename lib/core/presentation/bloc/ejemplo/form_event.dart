import 'package:equatable/equatable.dart';

abstract class FormEvent extends Equatable {
  const FormEvent();

  @override
  List<Object?> get props => [];
}

class LoadFormDataEvent extends FormEvent {}

class NameChanged extends FormEvent {
  final String name;

  const NameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class SurnameChanged extends FormEvent {
  final String surname;

  const SurnameChanged(this.surname);

  @override
  List<Object?> get props => [surname];
}

class EmailChanged extends FormEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class PhoneChanged extends FormEvent {
  final String phone;

  const PhoneChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class BirthDateChanged extends FormEvent {
  final DateTime birthDate;

  const BirthDateChanged(this.birthDate);

  @override
  List<Object?> get props => [birthDate];
}

class CountryChanged extends FormEvent {
  final String country;

  const CountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}

class RfcChanged extends FormEvent {
  final String rfc;

  const RfcChanged(this.rfc);

  @override
  List<Object?> get props => [rfc];
}

class TermsAcceptedChanged extends FormEvent {
  final bool termsAccepted;

  const TermsAcceptedChanged(this.termsAccepted);

  @override
  List<Object?> get props => [termsAccepted];
}

class FormSubmitted extends FormEvent {}
