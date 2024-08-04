import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_event.dart';
import 'package:bankingapp/core/presentation/bloc/movimientos/movimientos_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/transferencia_account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/retiro.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          child:
              BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
            if (state.card.isNotEmpty) {
              return Column(
                children: [
                  SizedBox(height: 10),
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
                                 Color.fromARGB(255, 255, 237, 176),
                                Color.fromARGB(255, 254, 187, 32),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RetiroPage(
                            my_account: state.card[0].card,
                            balance: state.balance.toString(),
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.money,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(height: 5),
                        Text('RETIRAR EFECTIVO',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
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
                        builder: (context, movimientoState) {
                      if (movimientoState.movimientos.isEmpty) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/transferencia");
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 4),
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  "Ningun movimiento por mostrar",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 156, 156, 156),
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }
                      return Column(
                        children: [
                          const Row(
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
                                    Icon(Icons.filter_list,
                                        color: Colors.white),
                                    SizedBox(width: 5),
                                    Text('Filtros',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                         const  Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Última semana',
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
                                final currentCard = state.card[0].card;

                                // Filtrar los movimientos relevantes
                                if (movimiento.sender_account == currentCard ||
                                    movimiento.receptor_account ==
                                        currentCard) {
                                  final isReceptor =
                                      movimiento.receptor_account ==
                                          currentCard;
                                  final iconPath = isReceptor
                                      ? 'assets/images/transferencia.png'
                                      : 'assets/images/uptransferencia.png';

                                  final amountSign = isReceptor ? '+' : '-';
                                  final monto =
                                      '$amountSign\$${movimiento.amount}';

                                  return GestureDetector(
                                    onTap: () {},
                                    child: _buildMovimientoItem(
                                      iconPath: iconPath,
                                      titulo: 'Transferencia',
                                      responsable: isReceptor
                                          ? ''
                                          : 'Cuenta: ${movimiento.receptor_account}',
                                      monto: monto,
                                      concepto: movimiento.concept.toString(),
                                      isReceptor: isReceptor,
                                    ),
                                  );
                                }

                                return SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              );
            }
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [SizedBox(height: 500), CircularProgressIndicator()],
            );
          }),
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
    required String concepto,
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
