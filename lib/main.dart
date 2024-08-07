import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_state.dart';
import 'package:bankingapp/core/presentation/screens/configuracion.dart';
import 'package:bankingapp/core/presentation/screens/servicios/beneficios.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/agregar_contacto.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_contacto.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_cuenta.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
import 'package:bankingapp/core/presentation/screens/auth/perfil.dart';
import 'package:bankingapp/core/presentation/screens/auth/registro.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:bankingapp/core/presentation/screens/servicios/servicios.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_vista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_bloc.dart';
import 'package:bankingapp/core/presentation/screens/auth/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(RegisterRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Banking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(title: 'Banking-page'),
          '/casa': (context) => const CasaView(),
          '/login': (context) => const LoginPage(),
          '/beneficios': (context) => const BeneficiosPage(),
          '/transferencia_cuenta': (context) => Transferencia_cuenta(
                user_account:
                    ModalRoute.of(context)!.settings.arguments as String,
                balance: ModalRoute.of(context)!.settings.arguments as double,
              ),
          '/mistarjetas': (context) => const MisTarjetas(),
          '/transferencia': (context) => const Transferencia(),
          '/servicios': (context) => const ServiciosPage(),
          '/tarjetas': (context) => const TarjetasList(),
          '/retiro': (context) => RetiroPage(
            my_account: ModalRoute.of(context)!.settings.arguments as String,
            balance: ModalRoute.of(context)!.settings.arguments as String,
          ),
          '/config': (context) => Configuracion(),
          '/registro': (context) => RegisterPage(),
          '/perfil': (context) => ProfilePage(),
          '/register_contact': (context) => RegisterContactPage(),
          '/transferencia_view': (context) => TransferSuccessView(
            amount: ModalRoute.of(context)!.settings.arguments as String,
            nickname: ModalRoute.of(context)!.settings.arguments as String,
            receptor_account: ModalRoute.of(context)!.settings.arguments as String,
            concepto: ModalRoute.of(context)!.settings.arguments as String,
          ),
          '/transferencia2': (context) => Tranferencia2(
                id: ModalRoute.of(context)!.settings.arguments as String,
                idUser: ModalRoute.of(context)!.settings.arguments as String,
                nickname: ModalRoute.of(context)!.settings.arguments as String,
                receptor_account: ModalRoute.of(context)!.settings.arguments as String,
                sende_account: ModalRoute.of(context)!.settings.arguments as String,
                balance: ModalRoute.of(context)!.settings.arguments as String,
              ),
        },
      ),
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                LoginPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
