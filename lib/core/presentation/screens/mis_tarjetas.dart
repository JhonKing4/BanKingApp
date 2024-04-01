import 'package:bankingapp/core/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MisTarjetas extends StatefulWidget {
  @override
  _MisTarjetasState createState() => _MisTarjetasState();
}

class _MisTarjetasState extends State<MisTarjetas> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
             Image.asset(
                "assets/images/horizontal.png",
                width: 120,
                height: 90,
              ),
            SizedBox(
              height: 290.0, // Altura total del carrusel
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: [
                  Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(
                              255, 250, 238, 127), 
                          Color.fromARGB(
                              255, 254, 187, 32), 
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    width: 400,
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
                              Text('**** **** **** 11223',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20),
                              Text('\$7,896.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 76, 49, 134), 
                          Color.fromARGB(255, 14, 1, 37), 
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    width: 400,
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
                              Text('**** **** **** 11223',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20),
                              Text('\$5,536.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                 Container(
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 205, 205, 205), // Color naranja más claro
                          Color.fromARGB(255, 118, 118, 119), // Color naranja más oscuro
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    width: 400,
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
                              Text('**** **** **** 11223',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 20),
                              Text('\$5,536.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 44, 44, 44),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ultimos movimientos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.filter_list, color: Colors.white),
                              SizedBox(width: 5),
                              Text('Filtros',
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Hoy',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    _buildMovimientoItem(
                      iconPath: 'assets/images/uptransferencia.png',
                      titulo: 'Transferencia',
                      hora: '12:00 pm',
                      monto: '+ \$5100.00',
                    ),
                    _buildMovimientoItem(
                      iconPath: 'assets/images/uptransferencia.png',
                      titulo: 'Pago',
                      hora: '10:30 am',
                      monto: '+ \$200.00',
                    ),
                    _buildMovimientoItem2(
                      iconPath: 'assets/images/transferencia.png',
                      titulo: 'Farmacias del ahorro',
                      hora: '10:30 am',
                      monto: '- \$745.00',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Ultima semana',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    _buildMovimientoItem2(
                      iconPath: 'assets/images/transferencia.png',
                      titulo: 'Netflix',
                      hora: '9:45 am',
                      monto: '- \$150.00',
                    ),
                    _buildMovimientoItem2(
                      iconPath: 'assets/images/transferencia.png',
                      titulo: 'Amazon',
                      hora: '6:20 am',
                      monto: '- \$3000.00',
                    ),
                    _buildMovimientoItem(
                      iconPath: 'assets/images/uptransferencia.png',
                      titulo: 'Mercado libre',
                      hora: '16:12 pm',
                      monto: '+ \$150.00',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMovimientoItem({
    required String iconPath,
    required String titulo,
    required String hora,
    required String monto,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(iconPath),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: TextStyle(color: Colors.white)),
                Text(hora, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(
            monto,
            style: TextStyle(
              color: Color.fromARGB(255, 177, 177, 177),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMovimientoItem2({
    required String iconPath,
    required String titulo,
    required String hora,
    required String monto,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage(iconPath),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(titulo, style: TextStyle(color: Colors.white)),
                Text(hora, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Text(
            monto,
            style: TextStyle(
              color: Color.fromARGB(255, 135, 135, 135),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
