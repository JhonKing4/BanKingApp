
import 'package:bankingapp/core/presentation/bloc/tarjetas_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas_event.dart';
import 'package:bankingapp/core/presentation/bloc/tarjetas_state.dart';
import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_tarjetas_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/tarjetas_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TarjetasList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TarjetasBloc(LoadTarjetaData(TarjetaRepositoryImpl()))
            ..add(LoadTarjetasDataEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        body: BlocBuilder<TarjetasBloc, TarjetasState>(
          builder: (context, state) {
            // Verificar si state.tarjetas es null o vacío
            if (state.tarjetas == null || state.tarjetas.isEmpty) {
              return Center(
                child: CircularProgressIndicator(), // Puedes mostrar un indicador de carga o un mensaje de que no hay datos
              );
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: List.generate(state.tarjetas.length, (index) {
                    final tarjeta = state.tarjetas[index];
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
                                  tarjeta.tarjeta_pic,
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
                                  tarjeta.numero_tarjeta,
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
                                  '\$${tarjeta.saldo_tarjeta.toStringAsFixed(2)}',
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
      ),
    );
  }
}
