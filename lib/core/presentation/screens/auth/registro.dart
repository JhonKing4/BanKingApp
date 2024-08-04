import 'package:bankingapp/core/presentation/bloc/registro/usuarios_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/registro/usuarios_event.dart';
import 'package:bankingapp/core/presentation/bloc/registro/usuarios_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isNameValid = true;
  bool isLastnameValid = true;
  bool isEmailValid = true;
  bool isRfcValid = true;
  bool isPhoneValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    final userRepository = RegisterRepositoryImpl();
    final submitUser = SubmitRegister(userRepository);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: Center(
        child: BlocProvider(
          create: (context) => RegisterBloc(submitUser),
          child: BlocListener<RegisterBloc, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Éxito"),
                      content: Text("Te has registrado exitosamente"),
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
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state is RegisterInitial) {
                  return buildForm(context);
                } else if (state is RegisterLoading) {
                  return CircularProgressIndicator();
                } else {
                  return buildForm(context);  // Default to showing the form in other states
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
      padding: const EdgeInsets.all(60.0),
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
                        Navigator.pushNamed(context, "/");
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
            const SizedBox(height: 20),
            buildTextField(context, "Name", nameController, false, isNameValid, TextInputType.text),
            const SizedBox(height: 20),
            buildTextField(context, "Lastname", lastnameController, false, isLastnameValid, TextInputType.text),
            const SizedBox(height: 20),
            buildTextField(context, "Email", emailController, false, isEmailValid, TextInputType.emailAddress),
            const SizedBox(height: 20),
            buildTextField(context, "RFC", rfcController, false, isRfcValid, TextInputType.text),
            const SizedBox(height: 20),
            buildTextField(context, "Phone number", phoneController, false, isPhoneValid, TextInputType.phone),
            const SizedBox(height: 20),
            buildTextField(context, "Password", passwordController, true, isPasswordValid,TextInputType.text),
            const SizedBox(height: 20),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isNameValid = nameController.text.isNotEmpty && passwordController.text.length > 3;
                  isLastnameValid = lastnameController.text.isNotEmpty && passwordController.text.length > 3;
                  isEmailValid = emailController.text.isNotEmpty && isValidEmail(emailController.text);
                  isRfcValid = rfcController.text.isNotEmpty && passwordController.text.length > 12;
                  isPhoneValid = phoneController.text.isNotEmpty && passwordController.text.length > 8;
                  isPasswordValid = passwordController.text.isNotEmpty && passwordController.text.length > 8;
                });

                if (isNameValid &&
                    isLastnameValid &&
                    isEmailValid &&
                    isRfcValid &&
                    isPhoneValid &&
                    isPasswordValid) {
                  final user = UsuariosModel(
                    name: nameController.text,
                    lastname: lastnameController.text,
                    email: emailController.text,
                    rfc: rfcController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                    id_bank: 1,
                  );
                  BlocProvider.of<RegisterBloc>(context).add(SubmitRegisterEvent(user));
                }
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(242, 254, 141, 1)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
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

  Widget buildTextField(BuildContext context, String hintText, TextEditingController controller, bool obscureText, bool isValid, TextInputType keyboardType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
        filled: true,
        fillColor: const Color.fromRGBO(30, 33, 33, 1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: isValid ? null : 'Este campo es obligatorio',
      ),
      style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

    bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }
}
