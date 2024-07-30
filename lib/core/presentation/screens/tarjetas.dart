
import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarjetasList extends StatefulWidget {
   const TarjetasList({Key? key}) : super(key: key);
  @override
  _TarjetasViewState createState() => _TarjetasViewState();
}


class _TarjetasViewState extends State<TarjetasList> {
  int _currentIndex = 3;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AccountBloc(LoadAccountData(AccountRepositoryImpl()))
            ..add(LoadAccountDataEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
         appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<AccountBloc, AccountState>(
          builder: (context, state) {
            // Verificar si state.tarjetas es null o vacío
            if (state.card == null || state.card.isEmpty) {
              return Center(
                child: CircularProgressIndicator(), // Puedes mostrar un indicador de carga o un mensaje de que no hay datos
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: List.generate(state.card.length, (index) {
                    final tarjeta = state.card[index];
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 250, 238, 127),
                            Color.fromARGB(255, 254, 187, 32),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      width: 400,
                      height: 200,
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
                                Text(
                                  tarjeta.card,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  '\$${state.balance}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,// Ajusta el índice actual según sea necesario
          onTap: (index) {
            // Maneja la navegación aquí
          },
        ),
      ),
    );
  }
}

