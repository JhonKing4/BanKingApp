import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_bloc.dart';
import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:bankingapp/core/presentation/screens/beneficios.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Banking-page'), 
        '/beneficios': (context) => const BeneficiosPage(),
        '/mistarjetas': (context) => const MisTarjetas(),
        '/transferencia': (context) => const Transferencia(),
        '/servicios': (context) => const ServiciosPage(),
        '/retiro': (context) => const RetiroPage(),
        '/registro': (context) =>  RegisterPage()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 500,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const LoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}
