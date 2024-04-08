import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:bankingapp/core/presentation/screens/transferencia2.dart';
import 'package:flutter/material.dart';

class Tranferencia extends StatefulWidget {
  @override
  _TranferenciaState createState() => _TranferenciaState();
}

class _TranferenciaState extends State<Tranferencia> {
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
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                "assets/images/horizontal.png",
                width: 120,
                height: 90,
              ),
            const Text('Transferencias',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 30,),
                Text(
                  "Balance",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                Text(
                  " S 7,896.00",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 360,
                  height: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        const Color.fromARGB(255, 71, 167, 212),
                        Color.fromARGB(255, 162, 234, 229)
                      ],
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Transferir a",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         GestureDetector(
  onTap: () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Tranferencia2()),
    );
  },
  child: Column(
    children: [
      Image.asset(
        "assets/images/martin.png",
        width: 40,
        height: 40,
      ),
      Text(
        "Adrian",
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
      ),
    ],
  ),
),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/adrian.png",
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                "Jhon",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/julia.png",
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                "Julia",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Image.asset(
                                "assets/images/plus.png",
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                "Agregar",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 37, 39, 39),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        "Contactos",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 20), // Espacio entre las filas
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Color de fondo de la imagen
                            ),
                            // Imagen a la derecha
                            child: Image.asset(
                              "assets/images/leo.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                              width: 10), // Espacio entre la imagen y el texto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto en el medio
                                Text(
                                  "Leopoldo Salgado ",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Espacio entre el texto y la fecha
                                // Fecha a la izquierda
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "29 Marzo",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Espacio entre las filas
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Color de fondo de la imagen
                            ),
                            // Imagen a la derecha
                            child: Image.asset(
                              "assets/images/martin.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                              width: 10), // Espacio entre la imagen y el texto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto en el medio
                                Text(
                                  "Adrian Santome",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Espacio entre el texto y la fecha
                                // Fecha a la izquierda
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "15 Oct",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20), // Espacio entre las filas
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Color de fondo de la imagen
                            ),
                            // Imagen a la derecha
                            child: Image.asset(
                              "assets/images/adrian.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto en el medio
                                Text(
                                  "Jhon Smit",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Espacio entre el texto y la fecha
                                // Fecha a la izquierda
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "31 Agos",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ), // Espacio entre la imagen y el texto
                        ],
                      ),
                      SizedBox(height: 20), // Espacio entre las filas
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Color de fondo de la imagen
                            ),
                            // Imagen a la derecha
                            child: Image.asset(
                              "assets/images/julia.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(
                              width: 10), // Espacio entre la imagen y el texto
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto en el medio
                                Text(
                                  "Julia Casa Rivera",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Espacio entre el texto y la fecha
                                // Fecha a la izquierda
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "12 Nov",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              // Color de fondo de la imagen
                            ),
                            // Imagen a la derecha
                            child: Image.asset(
                              "assets/images/jack.png",
                              width: 40,
                              height: 40,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Texto en el medio
                                Text(
                                  "Jack Sullivan",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height:
                                        5), // Espacio entre el texto y la fecha
                                // Fecha a la izquierda
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "31 Agos",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ), // Espacio entre la imagen y el texto
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
