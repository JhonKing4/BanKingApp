import 'package:bankingapp/core/presentation/screens/appbar.dart';
import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:bankingapp/core/presentation/screens/transferencia2.dart';
import 'package:flutter/material.dart';

class TarjetasList extends StatefulWidget {
  @override
  _TarjetasList createState() => _TarjetasList();
}

class _TarjetasList extends State<TarjetasList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: CustomAppBar(),
      
      body: SingleChildScrollView(
         padding: EdgeInsets.all(20.0),
         
        child: Center(
        
          child:
          Column(
           children: [
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
                    height: 200,
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
                  SizedBox(height: 20),



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
                    height: 200,
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


                  SizedBox(height: 20.0),


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
                    height: 200,
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
      ),
    );
  }
}
