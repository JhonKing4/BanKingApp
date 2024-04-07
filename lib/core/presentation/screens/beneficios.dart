import 'package:flutter/material.dart';

class BeneficiosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
                "assets/images/horizontal.png",
                width: 120,
                height: 90,
              ),
            const Text('BENEFICIOS DE SOCIO BANKING',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
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
          color: Color.fromARGB(255, 113, 113, 113), // Puedes cambiar el color de fondo aquí
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
