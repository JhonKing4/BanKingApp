import 'package:bankingapp/core/presentation/screens/configuracion.dart';
import 'package:bankingapp/core/presentation/screens/perfil.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:bankingapp/core/presentation/screens/transferencia2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bankingapp/core/presentation/screens/beneficios.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:bankingapp/core/presentation/screens/valuenotifier.dart';  // Importa el ValueNotifier


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: tabIndexNotifier,
      builder: (context, index, _) {
        return CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_up_outlined),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.handshake_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                label: "",
              ),
            ],
            activeColor: Color.fromARGB(255, 255, 222, 37),
            inactiveColor: Color.fromARGB(255, 255, 255, 255),
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return CupertinoTabView(
                  builder: (BuildContext context) => CasaView(),
                  routes: {
                    '/casa': (context) => CasaView(),
                    '/transferencia': (context) => Transferencia(),
                    '/mistarjetas': (context) => MisTarjetas(),
                    '/perfil': (context) => ProfilePage(),
                    '/config': (context) => Configuracion()
                  },
                );
              case 1:
                return CupertinoTabView(
                  builder: (BuildContext context) => Transferencia(),
                  routes: {
                    '/transferencia': (context) => Transferencia(),
                    '/transferencia2': (context) => Tranferencia2(),
                  },
                );
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) => MisTarjetas(),
                  routes: {
                    '/mistarjetas': (context) => MisTarjetas(),
                    '/retiro': (context) => RetiroPage(),
                  },
                );
              case 3:
                return CupertinoTabView(
                  builder: (BuildContext context) => TarjetasList(),
                  routes: {
                    '/beneficios': (context) => BeneficiosPage(),
                  },
                );
              case 4:
                return CupertinoTabView(
                  builder: (BuildContext context) => ServiciosPage(),
                  routes: {
                    '/beneficios': (context) => BeneficiosPage(),
                  },
                );
              default:
                return CupertinoTabView(
                  builder: (BuildContext context) => Transferencia(),
                  routes: {
                    '/beneficios': (context) => BeneficiosPage(),
                  },
                );
            }
          },
        );
      },
    );
  }
}
