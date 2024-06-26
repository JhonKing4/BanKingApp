import 'package:bankingapp/core/presentation/bloc/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_state.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_state.dart';
import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/transferencia_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/transferencia2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Transferencia extends StatefulWidget {
  const Transferencia({Key? key}) : super(key: key);

  @override
  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TransferenciaBloc(LoadTransferenciaData(TransferenciaRepositoryImpl()))
                ..add(LoadTransferenciaDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(LoadHomeData(HomeRepositoryImpl()))
                ..add(LoadHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        body: BlocBuilder<TransferenciaBloc, TransferenciaState>(
          builder: (context, state) => SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state2) => Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Transferencias',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Balance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      state2.balance_general.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: 360,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 204, 239, 255),
                            Color.fromARGB(255, 162, 234, 229)
                          ],
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Transferir a",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: List.generate(
                                      state.transferencias.take(3).length, (index) {
                                    final tranferencia =
                                        state.transferencias[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Tranferencia2()),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            tranferencia.contacto_pic,
                                            width: 40,
                                            height: 40,
                                          ),
                                          Text(
                                            tranferencia.nombre_contacto,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      
                                    );
                                    
                                  }),
                                  
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/plus.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                    Text(
                                      "Agregar",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ]),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 37, 39, 39),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(
                            "Contactos",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: List.generate(state.transferencias.length,
                                (index) {
                              final tranferencia = state.transferencias[index];
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 60),
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      // Color de fondo de la imagen
                                    ),
                                    // Imagen a la derecha
                                    child: Image.asset(
                                      tranferencia.contacto_pic,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          10), // Espacio entre la imagen y el texto
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Texto en el medio
                                        Text(
                                          tranferencia.nombre_contacto,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                5), // Espacio entre el texto y la fecha
                                        // Fecha a la izquierda
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.verified,
                                              color: Colors.green,
                                              size: 16,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              "29 Marzo",
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                          ) // Espacio entre las filas
                        ],
                      ),
                    ),
                  ],
                ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
