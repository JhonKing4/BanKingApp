import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_event.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_state.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_event.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/servicio_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/transferencia_account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MisTarjetas extends StatefulWidget {
  const MisTarjetas({Key? key}) : super(key: key);

  @override
  _MisTarjetasState createState() => _MisTarjetasState();
}

class _MisTarjetasState extends State<MisTarjetas> {
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
          create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
            ..add(LoadHomeDataEvent()),
        ),
        BlocProvider(
          create: (context) => MovimientosBloc(
              LoadMovimientosData(TransferenciaAccountRepositoryImpl()))
            ..add(LoadMovimientosDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AccountBloc(LoadAccountData(AccountRepositoryImpl()))
                ..add(LoadAccountDataEvent()),
        )
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: SingleChildScrollView(
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (context, state) => Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: 200.0,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enableInfiniteScroll: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: List.generate(state.card.length, (index) {
                      final servicio = state.card[index];
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        margin: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 253, 236),
                              Color.fromRGBO(255, 239, 92, 1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        width: 460,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/visapng.png",
                                    width: 60,
                                    height: 60,
                                  ),
                                  Image.asset(
                                    "assets/images/chip.png",
                                    width: 30,
                                    height: 30,
                                  ),
                                  SizedBox(height: 10),
                                  Text(state.card[index].card,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 12)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 20),
                                  Text('\$ ${state.balance.toString()}',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/retiro");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.money,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      SizedBox(height: 5),
                      Text('RETIRAR EFECTIVO',
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 52, 52, 52),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 44, 44, 44),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: BlocBuilder<MovimientosBloc, MovimientosState>(
                    builder: (context, movimientoState) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'ÚLTIMOS MOVIMIENTOS',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.filter_list, color: Colors.white),
                                  SizedBox(width: 5),
                                  Text('Filtros',
                                      style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Ultima semana',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.40,
                          child: ListView.builder(
                            itemCount: movimientoState.movimientos.length,
                            itemBuilder: (context, index) {
                              final movimiento =
                                  movimientoState.movimientos[index];
                              if (movimiento.id_receptor == state.id_user ||
                                  movimiento.id_sender == state.id_user) {
                                final isReceptor = movimiento.id_receptor == state.id_user;
                                final iconPath = isReceptor
                                    ? 'assets/images/transferencia.png'
                                    : 'assets/images/uptransferencia.png';
                                return _buildMovimientoItem(
                                  iconPath: iconPath,
                                  titulo: 'Transferencia',
                                  responsable: isReceptor ? '' : 'cuenta: ${movimiento.receptor_account.toString()}',
                                  monto: '${isReceptor ? '+' : '-'}\$${movimiento.amount.toString()}',
                                  isReceptor: isReceptor,
                                );
                              }
                              return SizedBox.shrink();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: 2,
          onTap: _onTabTapped,
        ),
      ),
    );
  }

  Widget _buildMovimientoItem({
    required String iconPath,
    required String titulo,
    required String responsable,
    required String monto,
    required bool isReceptor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(iconPath),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: TextStyle(color: Colors.white)),
                if (!isReceptor)
                  Text(responsable, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(
            monto,
            style: TextStyle(
              color: isReceptor ? Colors.greenAccent : Colors.redAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

