import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isIdValid = true;
  bool isNameValid = true;
  bool isLastnameValid = true;
  bool isEmailValid = true;
  bool isRfcValid = true;
  bool isPhoneValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => PerfilBloc(
            LoadPerfilData(RegisterRepositoryImpl()),
          )..add(LoadPerfilDataEvent()),
        ),
        BlocProvider(
          create: (context) => PerfilUBloc(
            RegisterRepositoryImpl(), // Asegúrate de que el repositorio sea el correcto
          ),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
          title: const Text(
            "Perfil",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/casa");
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
        ),
        body: BlocListener<PerfilUBloc, PerfilUState>(
          listener: (context, state) {
            if (state is PerfilUSuccess) {
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
              } else if (state is PerfilUFailure) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text('Ocurrio un error inesperado: ' + state.message),
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
          child: BlocBuilder<PerfilBloc, PerfilState>(
            builder: (context, state) {
                idController.text = state.id.toString();
                nameController.text = state.name;
                lastnameController.text = state.lastname;
                emailController.text = state.email;
                rfcController.text = state.rfc;
                phoneController.text = state.phone;
                passwordController.text = state.password;
                return buildProfileForm(context);
            },
          ),
        ),
      ),
    );
  }

  Widget buildProfileForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagen de perfil
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage("assets/images/esca.jpg"), // Cambia por tu imagen
            ),
          ),
          const SizedBox(height: 20),

          // Sección de datos personales
          buildTextField(context, "ID", idController, false, isIdValid),
          const SizedBox(height: 10),
          buildTextField(context, "Nombre", nameController, false, isNameValid),
          const SizedBox(height: 10),
          buildTextField(
              context, "Apellido", lastnameController, false, isLastnameValid),
          const SizedBox(height: 10),
          buildTextField(context, "Email", emailController, false, isEmailValid,
              TextInputType.emailAddress),
          const SizedBox(height: 10),
          buildTextField(context, "RFC", rfcController, false, isRfcValid),
          const SizedBox(height: 10),
          buildTextField(context, "Teléfono", phoneController, false,
              isPhoneValid, TextInputType.phone),
          const SizedBox(height: 10),
          buildTextField(
              context, "Contraseña", passwordController, true, isPasswordValid),

          const SizedBox(height: 20),

          // Botones de acción
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción de guardar
                  final user = UsuariosModel(
                    id: int.parse(idController.text),
                    name: nameController.text,
                    lastname: lastnameController.text,
                    email: emailController.text,
                    rfc: rfcController.text,
                    phone: phoneController.text,
                    password: passwordController.text,
                    id_bank: 1
                  );

                  BlocProvider.of<PerfilUBloc>(context).add(UpdateUserEvent(user));
                },
                child: const Text("Guardar"),
              ),
              ElevatedButton(
                onPressed: () {
                  // Acción de cancelar
                  Navigator.pushReplacementNamed(context, "/casa");
                },
                child: const Text("Cancelar"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTextField(BuildContext context, String hintText,
      TextEditingController controller, bool obscureText, bool isValid,
      [TextInputType keyboardType = TextInputType.text]) {
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
              color:
                  isValid ? const Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color:
                  isValid ? const Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: isValid ? null : 'Este campo es obligatorio',
      ),
      style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
