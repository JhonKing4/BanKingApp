import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_state.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_event.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_state.dart';
import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_tarjetas_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/tarjetas_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/valuenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CasaView extends StatelessWidget {
  const CasaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TarjetasBloc(LoadTarjetaData(TarjetaRepositoryImpl()))
                ..add(LoadTarjetasDataEvent()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
            ..add(LoadHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        drawer: Drawer(
          backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) => Column(
                    children: [
                      ClipOval(
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
                    ],
                  ),
                ),

              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.yellow),
                title: Text(
                  'Mi perfil',
                  style: TextStyle(color: Colors.yellow),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/perfil");
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.yellow),
                title: Text(
                  'Configuracion',
                  style: TextStyle(color: Colors.yellow),
                ),
                onTap: () {
                  // Navegar a otra pantalla o realizar alguna acción
                },
              ),
              ListTile(
                leading: Icon(Icons.door_back_door, color: Colors.yellow),
                title: Text(
                  'Cerrar sesion',
                  style: TextStyle(color: Colors.yellow),
                ),
                onTap: () {
                  Navigator.pushReplacementNamed(context, "/");
                },
              ),
              // Agrega más ListTile según sea necesario
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BALANCE GENERAL',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$ ${state.balance_general.toString()}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 220),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 59, 59, 59),
                                    ),
                                    child: Icon(
                                      Icons.search_outlined,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<TarjetasBloc, TarjetasState>(
                  builder: (context, state) => Row(
                      children: List.generate(state.tarjetas.length, (index) {
                    final tarjeta = state.tarjetas[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              tarjeta.tarjeta_pic,
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 10),
                            Text('saldo',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 50, 50))),
                            Text('\$ ${tarjeta.saldo_tarjeta.toString()}',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24))),
                            SizedBox(height: 20),
                            Text(tarjeta.numero_tarjeta,
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 120, 120, 120))),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(40),
                          backgroundColor: Color.fromARGB(255, 251, 242, 106),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    );
                  })),
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child:
                        Text('FINANZAS', style: TextStyle(color: Colors.white)),
                  )
                ],
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            print("Transferencias button pressed " +
                                tabIndexNotifier.value.toString());
                            tabIndexNotifier.value = 1;
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 234, 255,
                                      142), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.star_border_outlined,
                                  color: const Color.fromARGB(255, 32, 32,
                                      32), // Color del icono blanco
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'TRANSFERIR',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            tabIndexNotifier.value = 2;
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 142, 191,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.money_outlined,
                                  color: const Color.fromARGB(255, 32, 32,
                                      32), // Color del icono blanco
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'RETIRAR',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 176, 142,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.gradient_sharp,
                                  color: Color.fromARGB(255, 32, 32,
                                      32), // Color del icono blanco
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'MOVIMIENTOS',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 255, 175, 129),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.person_2_outlined,
                                  color: Color.fromARGB(255, 32, 32, 32),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'TARJETAS',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('PAGO DE SERVICIOS',
                                style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 246, 250,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/Logo_Izzi.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'IZZI',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 246, 250,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/cfe.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'CFE',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 246, 250,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/infonavit.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'INFONAVIT',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 246, 250,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/attt.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'ATT&T',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 120,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Color.fromARGB(255, 246, 250,
                                      255), // Color del fondo rosa claro
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/mercadolobre.png",
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'MERCADO L...',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            backgroundColor: Color.fromARGB(255, 41, 41, 41),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
