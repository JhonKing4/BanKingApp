import 'package:bankingapp/core/presentation/screens/beneficios.dart';
import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/registro.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/transferencia2.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding().ensureSemantics();
  
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


    final _router = {
    //Logica de routeo para las vistas de la app
    '/': (context) => const LoginPage(),
    '/beneficios': (context) => const BeneficiosPage(),
    '/mistarjetas': (context) => const MisTarjetas(),
    '/transferencia': (context) => const Transferencia(),
    '/servicios': (context) => const ServiciosPage (),
    '/retiro': (context) => const RetiroPage(),
    '/registro': (context) => const RegisterPage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        //title: Text(widget.title),
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
                  
                  LoginPage(),
                ],
              ))),
    );
  }
}
