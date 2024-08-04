import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfilUpdate_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
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

  bool isNameValid = true;
  bool isLastnameValid = true;
  bool isEmailValid = true;
  bool isRfcValid = true;
  bool isPhoneValid = true;
  bool isEditing = false;

  String? nameError;
  String? lastnameError;
  String? emailError;
  String? rfcError;
  String? phoneError;

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
            RegisterRepositoryImpl(),
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

              BlocProvider.of<PerfilBloc>(context).add(LoadPerfilDataEvent());
              setState(() {
                isEditing = false;
              });
            } else if (state is PerfilUFailure) {
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
              if (!isEditing) {
                nameController.text = state.name ?? '';
                lastnameController.text = state.lastname ?? '';
                emailController.text = state.email ?? '';
                rfcController.text = state.rfc ?? '';
                phoneController.text = state.phone ?? '';
              }

              return buildProfileForm(context, state.id ?? 0);
            },
          ),
        ),
      ),
    );
  }

  Widget buildProfileForm(BuildContext context, int userId) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userId > 0
                ? Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/avatar.jpeg"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Mis datos:',
                        style: TextStyle(
                          color: Color.fromARGB(255, 229, 201, 74),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildNameField(),
                      const SizedBox(height: 10),
                      buildLastnameField(),
                      const SizedBox(height: 10),
                      buildEmailField(),
                      const SizedBox(height: 10),
                      buildRfcField(),
                      const SizedBox(height: 10),
                      buildPhoneField(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: isEditing
                                ? () {
                                    setState(() {
                                      isNameValid = nameController.text.isNotEmpty;
                                      isLastnameValid = lastnameController.text.isNotEmpty;
                                      isEmailValid = emailController.text.isNotEmpty && isValidEmail(emailController.text);
                                      isPhoneValid = phoneController.text.isNotEmpty && phoneController.text.length > 8;
                                      isRfcValid = rfcController.text.isNotEmpty && rfcController.text.length > 12;
                                    });
                                    if (isNameValid &&
                                        isLastnameValid &&
                                        isEmailValid &&
                                        isPhoneValid &&
                                        isRfcValid) {
                                      final user = UsuariosModel(
                                        id: userId,
                                        name: nameController.text,
                                        lastname: lastnameController.text,
                                        email: emailController.text,
                                        rfc: rfcController.text,
                                        phone: phoneController.text,
                                        password: "pass",
                                        id_bank: 1,
                                      );
                                      BlocProvider.of<PerfilUBloc>(context)
                                          .add(UpdateUserEvent(user));
                                    }
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(242, 254, 141, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text("Guardar"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                isEditing = !isEditing;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(254, 154, 141, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: Text(isEditing ? "Cancelar" : "Editar"),
                          ),
                        ],
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context)
                          .size
                          .height, // Ocupa todo el alto disponible
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return buildEditableTextField(
      hintText: "Nombre",
      controller: nameController,
      isEditing: isEditing,
      isValid: isNameValid,
      errorText: nameError,
      onChanged: (value) {
        setState(() {
          isNameValid = value.isNotEmpty;
          nameError = isNameValid ? null : 'El nombre es requerido';
        });
      },
      icon: Icons.person,
    );
  }

  Widget buildLastnameField() {
    return buildEditableTextField(
      hintText: "Apellido",
      controller: lastnameController,
      isEditing: isEditing,
      isValid: isLastnameValid,
      errorText: lastnameError,
      onChanged: (value) {
        setState(() {
          isLastnameValid = value.isNotEmpty;
          lastnameError = isLastnameValid ? null : 'El apellido es requerido';
        });
      },
      icon: Icons.person_outline,
    );
  }

  Widget buildEmailField() {
    return buildEditableTextField(
      hintText: "Email",
      controller: emailController,
      isEditing: isEditing,
      isValid: isEmailValid,
      errorText: emailError,
      onChanged: (value) {
        setState(() {
          isEmailValid = value.isNotEmpty && isValidEmail(value);
          emailError = isEmailValid ? null : 'Email inválido';
        });
      },
      icon: Icons.email,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget buildRfcField() {
    return buildEditableTextField(
      hintText: "RFC",
      controller: rfcController,
      isEditing: isEditing,
      isValid: isRfcValid,
      errorText: rfcError,
      onChanged: (value) {
        setState(() {
          isRfcValid = value.isNotEmpty && value.length > 12;
          rfcError = isRfcValid ? null : 'RFC inválido';
        });
      },
      icon: Icons.badge,
    );
  }

  Widget buildPhoneField() {
    return buildEditableTextField(
      hintText: "Teléfono",
      controller: phoneController,
      isEditing: isEditing,
      isValid: isPhoneValid,
      errorText: phoneError,
      onChanged: (value) {
        setState(() {
          isPhoneValid = value.isNotEmpty && value.length > 8;
          phoneError = isPhoneValid ? null : 'Teléfono inválido';
        });
      },
      icon: Icons.phone,
      keyboardType: TextInputType.phone,
    );
  }

  Widget buildEditableTextField({
    required String hintText,
    required TextEditingController controller,
    required bool isEditing,
    required bool isValid,
    String? errorText,
    required Function(String) onChanged,
    bool obscureText = false,
    TextInputType? keyboardType,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(isEditing ? Icons.edit : icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: controller,
                readOnly: !isEditing,
                obscureText: obscureText,
                keyboardType: keyboardType,
                style: const TextStyle(color: Colors.white, fontSize: 16.0),
                onChanged: isEditing ? onChanged : null,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: isEditing ? (isValid ? Colors.yellow : Colors.red) : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: isEditing ? (isValid ? Colors.yellow : Colors.red) : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (errorText != null) Text(errorText, style: TextStyle(color: Colors.red)),
      ],
    );
  }

  bool isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+',
    );
    return emailRegExp.hasMatch(email);
  }
}



