import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_state.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_state.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_event.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas/tarjetas_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/servicio_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/servicios/servios_pago.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_tarjetas_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/tarjetas_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/servicios/servicios.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/widgets/valuenotifier.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CasaView extends StatefulWidget {
  const CasaView({Key? key}) : super(key: key);

  @override
  _CasaViewState createState() => _CasaViewState();
}

class _CasaViewState extends State<CasaView> {
  int _currentIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
        BlocProvider(
          create: (context) =>
              ServicioBloc(LoadServicioData(ServicioRepositoryImpl()))
                ..add(LoadServicioDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AccountBloc(LoadAccountData(AccountRepositoryImpl()))
                ..add(LoadAccountDataEvent()),
        )
      ],
      child: Scaffold(
        extendBody: true,
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
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
                    child: BlocBuilder<AccountBloc, AccountState>(
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
                                    '\$ ${state.balance.toString()}',
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
                child: BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, state) => Row(
                      children: List.generate(state.card.length, (index) {
                    final tarjeta = state.card[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/visapng.png',
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 10),
                            Text('saldo',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 50, 50))),
                            Text('\$ ${state.balance.toString()}',
                                style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 24, 24, 24))),
                            SizedBox(height: 20),
                            Text(tarjeta.card.toString(),
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
                            Navigator.pushNamed(context, "/transferencia");
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
                            print("Transferencias button pressed " +
                                tabIndexNotifier.value.toString());
                            tabIndexNotifier.value = 2;
                            Navigator.pushNamed(context, "/retiro");
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
                          onPressed: () {
                            print("Transferencias button pressed " +
                                tabIndexNotifier.value.toString());
                            tabIndexNotifier.value = 3;
                            Navigator.pushNamed(context, "/mistarjetas");
                          },
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
                          onPressed: () {
                            print("Transferencias button pressed " +
                                tabIndexNotifier.value.toString());
                            tabIndexNotifier.value = 4;
                            Navigator.pushNamed(context, "/tarjetas");
                          },
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
              BlocBuilder<ServicioBloc, ServicioState>(
                builder: (context, servicioState) {
                  if (servicioState.servicios.isNotEmpty) {
                    return BlocBuilder<AccountBloc, AccountState>(
                      builder: (context, accountState) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                servicioState.servicios.length, (index) {
                              final servicio = servicioState.servicios[index];
                              return Container(
                                width: 120,
                                height: 120,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        backgroundColor: Colors.transparent,
                                        isScrollControlled: true,
                                        builder: (context) =>
                                            DraggableScrollableSheet(
                                          initialChildSize: 0.5,
                                          maxChildSize: 0.75,
                                          minChildSize: 0.25,
                                          builder: (context, scrollController) {
                                            return ServicioModal(
                                              servicio: servicio,
                                              account: AccountModel(
                                                id: accountState.id,
                                                id_user: accountState.id_user,
                                                balance: accountState.balance,
                                                status: accountState.status,
                                                card: accountState.card,
                                                user: accountState.user ??
                                                    UsuariosModel
                                                        .defaultUser(), // Manejar null
                                              ), // Usar accountState aquí
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: Color.fromARGB(
                                                255, 246, 250, 255),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CachedNetworkImage(
                                                imageUrl:
                                                    servicio.icono.toString(),
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                              ),

                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          servicio.name,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      backgroundColor:
                                          Color.fromARGB(255, 41, 41, 41),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    );
                  } else if (servicioState.errorMessage.isNotEmpty) {
                    return Center(
                      child: Text(
                        'Error: ${servicioState.errorMessage}',
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex:
              _currentIndex, // Ajusta el índice actual según sea necesario
          onTap: (index) {
            // Maneja la navegación aquí
          },
        ),
      ),
    );
  }
}
