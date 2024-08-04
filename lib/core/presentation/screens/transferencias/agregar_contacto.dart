import 'package:bankingapp/core/presentation/bloc/Contacts/contact_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_event.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_contact_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/contacts_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterContactPage extends StatefulWidget {
  @override
  _RegisterContactPageState createState() => _RegisterContactPageState();
}

class _RegisterContactPageState extends State<RegisterContactPage> {
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController bankController = TextEditingController();

  bool isnicknameValid = true;
  bool isEmailValid = true;
  bool isPhoneValid = true;
  bool isbankValid = true;
  bool isaccountValid = true;

  String? emailError;
  String? phoneError;
  String? accountError;

  @override
  Widget build(BuildContext context) {
    final userRepository = ContactRepositoryImpl();
    final submitUser = SubmitRegisterContact(userRepository);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: Center(
        child: BlocProvider(
          create: (context) => RegisterContactBloc(submitUser),
          child: BlocListener<RegisterContactBloc, RegisterContactState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Éxito"),
                      content: Text("El contacto se agrego exitosamente"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        ),
                      ],
                    );
                  },
                );
              } else if (state is RegisterError) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Aceptar"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: BlocBuilder<RegisterContactBloc, RegisterContactState>(
              builder: (context, state) {
                if (state is RegisterInitial) {
                  return buildForm(context);
                } else if (state is RegisterLoading) {
                  return CircularProgressIndicator();
                } else {
                  return buildForm(
                      context); // Default to showing the form in other states
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/transferencia");
                      },
                      icon: Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 44, 44, 44),
                            ),
                          ),
                          Positioned(
                            left: 7,
                            top: 9,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Registrar un contacto",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/users.png',
                  width: 70,
                  height: 70,
                ),
                SizedBox(height: 4),
              ],
            ),
            const SizedBox(height: 20),
            buildTextField(context, "Nombre de usuario", nicknameController,
                false, isnicknameValid),
            const SizedBox(height: 20),
            buildTextField(
                context, "Email", emailController, false, isEmailValid, emailError, TextInputType.emailAddress),
            const SizedBox(height: 20),
            buildTextField(
                context, "Teléfono", phoneController, false, isPhoneValid, phoneError, TextInputType.phone),
            const SizedBox(height: 20),
            buildTextField(context, "Nombre del banco", bankController,
                false, isbankValid),
            const SizedBox(height: 20),
            buildTextField(
                context, "Cuenta", accountController, false, isaccountValid, accountError, TextInputType.number),
            const SizedBox(height: 20),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isnicknameValid = nicknameController.text.isNotEmpty;
                  isbankValid = bankController.text.isNotEmpty;
                  isEmailValid = emailController.text.isNotEmpty && isValidEmail(emailController.text);
                  emailError = isEmailValid ? null : 'No es un email válido';
                  isPhoneValid = phoneController.text.isNotEmpty && phoneController.text.length > 8;
                  phoneError = isPhoneValid ? null : 'El teléfono debe tener al menos 8 dígitos';
                  isaccountValid = accountController.text.isNotEmpty && accountController.text.length >= 16;
                  accountError = isaccountValid ? null : 'La cuenta debe tener al menos 16 dígitos';
                });

                if (isnicknameValid && isbankValid && isEmailValid && isPhoneValid && isaccountValid) {
                  final contact = ContactsModel(
                    nickname: nicknameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                    bankname: bankController.text,
                    account: accountController.text,
                  );
                  BlocProvider.of<RegisterContactBloc>(context)
                      .add(SubmitRegisterContactEvent(contact));
                }
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(242, 254, 141, 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                child: const Text(
                  "Aceptar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String hintText,
      TextEditingController controller, bool obscureText, bool isValid,
      [String? errorText, TextInputType? keyboardType]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
        filled: true,
        fillColor: const Color.fromRGBO(30, 33, 33, 1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: isValid ? null : errorText,
      ),
      style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
      obscureText: obscureText,
      keyboardType: keyboardType
    );
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }
}
