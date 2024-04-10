import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/servicios.dart';
import 'package:flutter/material.dart';

class BeneficiosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiciosPage(),
                          ),
                        );
                      },
                      icon: Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 44, 44, 44), // Color del círculo más claro
                            ),
                          ),
                          Positioned(
                            left:
                                7, // Ajusta la posición de la flecha según sea necesario
                            top:
                                9, // Ajusta la posición de la flecha según sea necesario
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 255, 255, 255), // Color de la flecha
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            const Text(
              'BENEFICIOS DE SOCIO BANKING',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/sony.png',
                    text: 'SONY',
                    desc: '12 Meses sin intereses',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/newera.png',
                    text: 'NEW ERA',
                    desc: '6 Meses sin intereses',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/mcstore.png',
                    text: 'MACSTORE',
                    desc: '2 Meses sin intereses',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/philips.png',
                    text: 'PHILIPS',
                    desc: '12 Meses sin intereses',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/disney.png',
                    text: 'DISNEY +',
                    desc: '2 Meses gratis',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/creditcards.png',
                    text: 'MESES SIN INTERESES',
                    desc: 'Hasta 70% off',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ServicioButton extends StatelessWidget {
  final String image;
  final String text;
  final String desc;

  const ServicioButton({
    Key? key,
    required this.image,
    required this.text,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(
              255, 113, 113, 113), // Puedes cambiar el color de fondo aquí
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
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
            SizedBox(height: 2),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
