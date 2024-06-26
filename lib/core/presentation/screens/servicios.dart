import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_servicio_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/servicio_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_state.dart';
import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/beneficios.dart';

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
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => BeneficiosPage()),
                        );
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
                          image: servicio.servicio_pic,
                          text: servicio.nombre_servicio,
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
  final String image;
  final String text;

  const ServicioButton({
    Key? key,
    required this.image,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 113, 113, 113), // Puedes cambiar el color de fondo aquí
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
                color: Color.fromARGB(137, 222, 255, 251), // Color de fondo de la imagen
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0), // Ajusta el espacio entre el borde de la imagen y el borde del círculo
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: AssetImage(image), // Ajusta la forma en que la imagen se ajusta al círculo
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
