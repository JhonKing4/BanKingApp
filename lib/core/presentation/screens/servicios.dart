import 'package:bankingapp/core/presentation/bloc/servicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicio_state.dart';
import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/beneficios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiciosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: CustomAppBar(),
      body: BlocBuilder<ServicioBloc, ServicioState>(builder: (context, state) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40),
            const Text('Pago de servicios',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            
            ),
            SizedBox(height: 10,),
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
                  Text('Beneficios de la app',
                      style: TextStyle(fontSize: 10, color: Colors.white))
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 52, 52, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: state.servicio_pic,
                    text: state.nombre_servicio,
                  ),
                ),
              ],
            ),
          ],
        ),
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
