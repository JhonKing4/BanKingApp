import 'package:bankingapp/core/presentation/bloc/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   const CustomAppBar({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Builder(
            builder: (context) => Row(
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
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 10), // Ajuste del espacio entre la imagen y el texto
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return Text(
                      state.usuario_name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Image.asset(
                "assets/images/horizontal.png",
                width: 120,
                height: 90,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {
                // Navegar a la página de inicio
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Perfil'),
              onTap: () {
                // Navegar a la página de perfil
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configuraciones'),
              onTap: () {
                // Navegar a la página de configuraciones
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar Sesión'),
              onTap: () {
                // Implementar el cierre de sesión
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Contenido de la página principal'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
