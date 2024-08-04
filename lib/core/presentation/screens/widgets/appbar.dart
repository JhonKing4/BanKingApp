import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_state.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_event.dart';
import 'package:bankingapp/core/presentation/bloc/perfil/perfil_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_perfil_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
            ..add(LoadHomeDataEvent()),
        ),
        BlocProvider(
          create: (context) => PerfilBloc(
            LoadPerfilData(RegisterRepositoryImpl()),
          )..add(LoadPerfilDataEvent()),
        )
      ],
      child: Builder(
        builder: (context) {
          return AppBar(
            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: ClipOval(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Image.asset(
                          state.usuario_pic,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BlocBuilder<PerfilBloc, PerfilState>(
                    builder: (context, statename) {
                      return Text(
                        statename.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset(
                      "assets/images/horizontal.png",
                      width: 120,
                      height: 90,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(30, 33, 33, 1),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _buildDrawerHeader(context),
            _buildListTile(context, Icons.person, 'Mi perfil', '/perfil'),
            _buildListTile(context, Icons.settings, 'Configuración', '/config'),
            Divider(color: Colors.white.withOpacity(0.5)),
            _buildListTile(context, Icons.info, 'Acerca de', '/about'),
            _buildListTile(
                context, Icons.feedback, 'Enviar comentarios', '/feedback'),
            Divider(color: Colors.white.withOpacity(0.5)),
            _buildListTile(
                context, Icons.exit_to_app, 'Cerrar sesión', '/login'),
            SizedBox(height: 20),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerHeader(BuildContext context) {
    return DrawerHeader(
      child: Center(
        child: ClipOval(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Image.asset(
                state.usuario_pic,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        if (title == 'Cerrar sesión') {
          BlocProvider.of<UserBloc>(context).add(LogoutButtonPressed());
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', (Route<dynamic> route) => false);
        } else {
          Navigator.pushReplacementNamed(context, route);
        }
      },
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Divider(color: Colors.white.withOpacity(0.5)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Versión 1.0.0',
            style: TextStyle(color: const Color.fromARGB(255, 167, 167, 167)),
          ),
        ),
        SizedBox(height: 10),
        Text(
          '© 2024 Banking. Todos los derechos reservados.',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 192, 18).withOpacity(0.8),
              fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
