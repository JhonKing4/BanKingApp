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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/usuarios_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
  bool isEditing = false; // Estado para controlar el modo de edición

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
              // Mostrar el diálogo de éxito
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Éxito"),
                    content: Text("Datos actualizados correctamente"),
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

              // Recargar los datos del perfil después de actualizar
              BlocProvider.of<PerfilBloc>(context).add(LoadPerfilDataEvent());
              setState(() {
                isEditing =
                    false; // Desactivar el modo de edición después de guardar
              });
            } else if (state is PerfilUFailure) {
              // Mostrar el diálogo de error
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content:
                        Text('Ocurrió un error inesperado: ' + state.message),
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
              // Actualizar los controladores de texto con los nuevos datos del estado
              nameController.text = state.name ?? '';
              lastnameController.text = state.lastname ?? '';
              emailController.text = state.email ?? '';
              rfcController.text = state.rfc ?? '';
              phoneController.text = state.phone ?? '';
              passwordController.text = state.password ?? '';

              return buildProfileForm(
                  context,
                  state.id ??
                      0); // Proporcionar un valor predeterminado para id si es null
            },
          ),
        ),
      ),
    );
  }

  Widget buildProfileForm(BuildContext context, int userId) {
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
          Column(
            children: [
              Text('Mis datos:',
                  style: TextStyle(color: Color.fromARGB(255, 255, 208, 1),fontSize: 18,fontWeight: FontWeight.bold))
            ],
          ),
          // Sección de datos personales
          buildEditableTextField(context, "Nombre", nameController, isEditing),
          const SizedBox(height: 10),
          buildEditableTextField(
              context, "Apellido", lastnameController, isEditing),
          const SizedBox(height: 10),
          buildEditableTextField(context, "Email", emailController, isEditing,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 10),
          buildEditableTextField(context, "RFC", rfcController, isEditing),
          const SizedBox(height: 10),
          buildEditableTextField(
              context, "Teléfono", phoneController, isEditing,
              keyboardType: TextInputType.phone),
          const SizedBox(height: 10),
          buildEditableTextField(
              context, "Contraseña", passwordController, isEditing,
              obscureText: true),

          const SizedBox(height: 20),

          // Botones de acción
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: isEditing
                    ? () {
                        // Acción de guardar
                        final user = UsuariosModel(
                            id: userId,
                            name: nameController.text,
                            lastname: lastnameController.text,
                            email: emailController.text,
                            rfc: rfcController.text,
                            phone: phoneController.text,
                            password: passwordController.text,
                            id_bank: 1);

                        BlocProvider.of<PerfilUBloc>(context)
                            .add(UpdateUserEvent(user));
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(242, 254, 141, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(isEditing ? "Guardar" : "Editar"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditing = !isEditing; // Alternar modo de edición
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(254, 154, 141, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(isEditing ? "Cancelar" : "Editar"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildEditableTextField(BuildContext context, String hintText,
      TextEditingController controller, bool isEditing,
      {bool obscureText = false, TextInputType? keyboardType}) {
    return TextFormField(
      controller: controller,
      readOnly:
          !isEditing, // Hacer el campo de solo lectura si no está en modo de edición
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color.fromRGBO(30, 33, 33, 1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEditing
                ? Colors.yellow
                : Colors
                    .transparent, // Borde amarillo cuando está en modo de edición
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: isEditing
                ? Colors.yellow
                : Colors
                    .transparent, // Borde amarillo cuando está en modo de edición
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
