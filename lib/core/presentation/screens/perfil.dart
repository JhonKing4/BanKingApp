import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';

class ProfilePage extends StatelessWidget {
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
    return BlocProvider(
      create: (context) => PerfilBloc(
        LoadPerfilData(
            RegisterRepositoryImpl()), // Asegúrate de que RegisterRepositoryImpl esté accesible
      )..add(LoadPerfilDataEvent()),
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
        body: BlocBuilder<PerfilBloc, PerfilState>(
          builder: (context, state) {
            TextEditingController nameController =
                TextEditingController(text: state.name);
            TextEditingController lastnameController =
                TextEditingController(text: state.lastname);
            TextEditingController emailController =
                TextEditingController(text: state.email);
            TextEditingController rfcController =
                TextEditingController(text: state.rfc);
            TextEditingController phoneController =
                TextEditingController(text: state.phone);
            TextEditingController passwordController =
                TextEditingController(text: state.password);

            return buildProfileForm(context);
          },
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
                  print("Guardar");
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
