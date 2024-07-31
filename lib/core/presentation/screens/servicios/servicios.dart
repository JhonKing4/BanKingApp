import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/servicios/servios_pago.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/servicio_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/servicio_state.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';

class ServiciosPage extends StatelessWidget {
  const ServiciosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServicioBloc>(
          create: (context) => ServicioBloc(
            LoadServicioData(ServicioRepositoryImpl()),
          )..add(LoadServicioDataEvent()),
        ),
        BlocProvider<AccountBloc>(
          create: (context) => AccountBloc(
            LoadAccountData(AccountRepositoryImpl()),
          )..add(LoadAccountDataEvent()),
        ),
         BlocProvider(
          create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
            ..add(LoadHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<ServicioBloc, ServicioState>(
          builder: (context, servicioState) {
            if (servicioState.servicios.isNotEmpty) {
              return BlocBuilder<AccountBloc, AccountState>(
                builder: (context, accountState) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        const Text(
                          'Pago de servicios',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/beneficios");
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Beneficios de la app',
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 52, 52, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          children: List.generate(
                              servicioState.servicios.length, (index) {
                            final servicio = servicioState.servicios[index];
                            return ServicioButton(
                              servicio: servicio,
                              account: AccountModel(
                                id: accountState.id,
                                id_user: accountState.id_user,
                                balance: accountState.balance,
                                status: accountState.status,
                                card: accountState.card,
                                user: accountState.user ??
                                    UsuariosModel.defaultUser(), // Manejar null
                              ),
                            );
                          }),
                        ),
                      ],
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
         bottomNavigationBar: CustomBottomNavBar(
              currentIndex: 4, // Ajusta el índice actual según sea necesario
              onTap: (index) {
                // Maneja la navegación aquí
              },
            ),
      ),
    );
  }
}

class ServicioButton extends StatelessWidget {
  final servicioModel servicio;
  final AccountModel account;

  const ServicioButton({
    Key? key,
    required this.servicio,
    required this.account,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (context) => DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 0.75,
            minChildSize: 0.25,
            builder: (context, scrollController) {
              return ServicioModal(
                servicio: servicio,
                account: account,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Color.fromARGB(255, 113, 113, 113),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(137, 222, 255, 251),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                        image: AssetImage(servicio.icono),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                servicio.name,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
