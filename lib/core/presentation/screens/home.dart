import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/main.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined
              
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.arrow_circle_up_outlined,
            ),
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
        Widget tab;
        switch (index) {
          case 0:
            tab = CasaView();
            break;
          case 1:
            tab = Transferencia();
            break;
          case 2:
            tab = MisTarjetas();
            break;
          case 3:
            tab = TarjetasList();
            break;
            case 4:
            tab = ServiciosPage();
            break;
          default:
            tab = Transferencia();
        }
        return CupertinoTabView(
          builder: (BuildContext context) => tab,
        );
      },
    );
  }
}

