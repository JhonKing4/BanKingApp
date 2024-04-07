import 'package:bankingapp/core/presentation/screens/beneficios.dart';
import 'package:flutter/material.dart';

class ServiciosPage extends StatelessWidget {
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
            const Text('Pago de servicios',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
            
            ),
               ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BeneficiosPage()),
            );
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(242, 254, 141, 1)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
            SizedBox(height: 30,),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/Logo_Izzi.png',
                    text: 'IZZI',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/mercadolobre.png',
                    text: 'MERCAD...',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/infonavit.png',
                    text: 'INFONAVIT',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/cfe.png',
                    text: 'CFE',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/netflix.png',
                    text: 'NETFLIX',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/telmex.png',
                    text: 'TELMEX',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/max.png',
                    text: 'MAX',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/disney.png',
                    text: 'DISNEY +',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/dish.png',
                    text: 'DISH',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/totalplay.png',
                    text: 'TOTALPLAY',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/axtel.png',
                    text: 'AXTEL',
                  ),
                ),
                Expanded(
                  child: ServicioButton(
                    image: 'assets/images/star.png',
                    text: 'STAR +',
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
          ],
        ),
      ),
    );
  }
}
