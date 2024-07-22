import 'package:bankingapp/core/presentation/screens/servicios/servios_pago.dart';
import 'package:flutter/material.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';
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
    return BlocProvider(
      create: (context) => ServicioBloc(LoadServicioData(ServicioRepositoryImpl()))
        ..add(LoadServicioDataEvent()),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        body: BlocBuilder<ServicioBloc, ServicioState>(
          builder: (context, state) {
            if (state.servicios.isNotEmpty) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    const Text(
                      'Pago de servicios',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/beneficios");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.verified_user_outlined, color: Color.fromARGB(255, 255, 255, 255)),
                          SizedBox(height: 5),
                          Text('Beneficios de la app', style: TextStyle(fontSize: 10, color: Colors.white)),
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
                      children: List.generate(state.servicios.length, (index) {
                        final servicio = state.servicios[index];
                        return ServicioButton(
                          servicio: servicio,
                        );
                      }),
                    ),
                  ],
                ),
              );
            } else if (state.errorMessage.isNotEmpty) {
              return Center(
                child: Text(
                  'Error: ${state.errorMessage}',
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
      ),
    );
  }
}

class ServicioButton extends StatelessWidget {
  final servicioModel servicio;

  const ServicioButton({
    Key? key,
    required this.servicio,
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
              return ServicioModal(servicio: servicio);
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
                        image: AssetImage('assets/images/vertical.png'),
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


