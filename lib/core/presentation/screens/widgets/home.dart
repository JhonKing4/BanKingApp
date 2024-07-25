import 'package:bankingapp/core/presentation/screens/configuracion.dart';
import 'package:bankingapp/core/presentation/screens/auth/perfil.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bankingapp/core/presentation/screens/servicios/beneficios.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/servicios/servicios.dart';
import 'package:bankingapp/core/presentation/screens/widgets/valuenotifier.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List<AnimationController>.generate(
      5,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    _animations = _controllers
        .map((controller) => Tween<double>(begin: 1.0, end: 1.2).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.easeInOut,
              ),
            ))
        .toList();

    _controllers[_currentIndex].forward();
  }

  void _onTap(int index) {
    setState(() {
      _controllers[_currentIndex].reverse();
      _currentIndex = index;
      _controllers[_currentIndex].forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 0.8), // Fondo semi-transparente
        border: Border.all(style: BorderStyle.none), // Eliminar bordes
        items: [
          BottomNavigationBarItem(
            icon: AnimatedBuilder(
              animation: _animations[0],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[0].value,
                  child: child,
                );
              },
              child: Icon(Icons.home_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: AnimatedBuilder(
              animation: _animations[1],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[1].value,
                  child: child,
                );
              },
              child: Icon(Icons.arrow_circle_up_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AnimatedBuilder(
              animation: _animations[2],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[2].value,
                  child: child,
                );
              },
              child: Icon(Icons.handshake_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: AnimatedBuilder(
              animation: _animations[3],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[3].value,
                  child: child,
                );
              },
              child: Icon(Icons.credit_card_outlined),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: AnimatedBuilder(
              animation: _animations[4],
              builder: (context, child) {
                return Transform.scale(
                  scale: _animations[4].value,
                  child: child,
                );
              },
              child: Icon(Icons.shopping_bag_outlined),
            ),
            label: "",
          ),
        ],
        activeColor: Color.fromARGB(255, 255, 222, 37),
        inactiveColor: Color.fromARGB(255, 255, 255, 255),
        onTap: _onTap,
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _getPageForIndex(index);
          },
          routes: _getRoutes(index),
        );
      },
    );
  }

  Widget _getPageForIndex(int index) {
    switch (index) {
      case 0:
        return CasaView();
      case 1:
        return Transferencia();
      case 2:
        return MisTarjetas();
      case 3:
        return TarjetasList();
      case 4:
        return ServiciosPage();
      default:
        return Transferencia();
    }
  }

  Map<String, WidgetBuilder> _getRoutes(int index) {
    switch (index) {
      case 0:
        return {
          '/casa': (context) => CasaView(),
          '/transferencia': (context) => Transferencia(),
          '/mistarjetas': (context) => MisTarjetas(),
          '/perfil': (context) => ProfilePage(),
          '/config': (context) => Configuracion(),
        };
      case 1:
        return {
          '/transferencia': (context) => Transferencia(),
          '/transferencia2': (context) => Tranferencia2(
      id: ModalRoute.of(context)!.settings.arguments as String,
      idUser: ModalRoute.of(context)!.settings.arguments as String,
      nickname: ModalRoute.of(context)!.settings.arguments as String,
      account: ModalRoute.of(context)!.settings.arguments as String,
    ),
        };
      case 2:
        return {
          '/mistarjetas': (context) => MisTarjetas(),
          '/retiro': (context) => RetiroPage(),
        };
      case 3:
        return {
          '/beneficios': (context) => BeneficiosPage(),
        };
      case 4:
        return {
          '/beneficios': (context) => BeneficiosPage(),
        };
      default:
        return {
          '/beneficios': (context) => BeneficiosPage(),
        };
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
