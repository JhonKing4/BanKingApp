import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Configuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
        ..add(LoadHomeDataEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
          title: const Text(
            "Configuración",
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
        body: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) =>  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    children: <Widget>[
                      Image.asset(
                        state.usuario_pic,
                        height: 45,
                        width: 45,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        state.usuario_name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                
                SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        title: 'Notificaciones',
                        description: 'Todo lo que está pasando',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                child: Column(
                                  children: [
                                    CustomDropdownItem(
                                      title: 'Centro de avisos',
                                      description:
                                          'Centro de avisos.',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Contactos',
                                      description:
                                          'Sección de contactos.',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Mis reclamos',
                                      description:
                                          'Sección de reclamos.',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      CustomButton(
                        title: 'Ayuda',
                        description: 'Respuesta a todas tus dudas',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                child: Column(
                                  children: [
                                    CustomDropdownItem(
                                      title: 'Soporte al cliente',
                                      description:
                                          'Tel +52 998 355 0769',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Ayuda con contraseña',
                                      description:
                                          'Seccion de ayuda con contraseña.',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Sugerencias',
                                      description:
                                          'Sección de sugerencias.',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      CustomButton(
                        title: 'Seguridad',
                        description: 'Cambia tu contraseña, tu NIP, etc...',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                child: Column(
                                  children: [
                                    CustomDropdownItem(
                                      title: 'Cambio de contraseña',
                                      description:
                                          'Mi contraseña: ' + '*********',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Cambio de NIP',
                                      description:
                                          'Mi NIP: ' + '****',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Cambiar dirección de e-mail',
                                      description:
                                          'Mi email: ' + 'leonardod.rebollo@gmail.com',
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Restablecer pregunta de seguridad',
                                      description:
                                          'Pregunta actual: ' + '¿SI?',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      CustomButton(
                        title: 'Configuraciones datos personales',
                        description: 'Todas tus configuraciones personales',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    0.6,
                                child: Column(
                                  children: [
                                    CustomDropdownItem(
                                      title: 'Subir imagen de perfil',
                                      description:
                                          'Mi imagen de perfil actual: ' + state.usuario_pic,
                                      onTap: () {},
                                    ),
                                    CustomDropdownItem(
                                      title: 'Editar mi perfil',
                                      description:
                                          'Descripción de la edición de perfil.',
                                      onTap: () {
                                        Navigator.pushReplacementNamed(context, "/perfil");
                                      },
                                    ),
                                    CustomDropdownItem(
                                      title: 'Editar mi dirección',
                                      description:
                                          'Mi direccion actual: ' + 'AV.Arco norte SM 257',
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      CustomButton(
                        title: 'Cerrar sesión',
                        description: '',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: () {
                           Navigator.pushReplacementNamed(context, "/");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromARGB(255, 52, 52, 52),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomDropdownItem extends StatefulWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const CustomDropdownItem({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  _CustomDropdownItemState createState() => _CustomDropdownItemState();
}

class _CustomDropdownItemState extends State<CustomDropdownItem> {
  bool _showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            setState(() {
              _showDescription = !_showDescription;
            });
          },
        ),
        AnimatedCrossFade(
          duration: Duration(milliseconds: 300),
          crossFadeState: _showDescription
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              widget.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),
        ),// Separador entre elementos
      ],
    );
  }
}

