import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';




class TransferSuccessView extends StatelessWidget {
final String amount;
final String receptor_account;
final String nickname;
final String concepto;


 const TransferSuccessView ({
    Key? key,
    required this.amount,
    required this.receptor_account,
    required this.nickname,
    required this.concepto
  }) : super(key: key);

String random(int length) {
  final Random random = Random();
  const String chars = '0123456789';
  return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
}


  @override
  Widget build(BuildContext context) {
     String numeroRatreo = random(15);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);


    return Scaffold(
      backgroundColor:const Color.fromRGBO(30, 33, 33, 1),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
SizedBox(
  width: double.infinity,
  child: Container(
    padding: EdgeInsets.all(80),
    decoration: BoxDecoration(
       gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 3, 172, 160),
            Color.fromRGBO(37, 41, 41, 1)
          ],
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_circle,
          color:  Color.fromARGB(255, 105, 245, 110),
          size: 50,
        ),
        SizedBox(height: 10),
        Text(
          "TRANSFERENCIA EXITOSA",
          style: TextStyle(
            color: Color.fromARGB(255, 105, 245, 110),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          formattedDate,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 16,
          ),
        ),
        SizedBox(height: 20),
        Text(
          '\$ ${amount}',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  ),
),


              Container(
                padding: EdgeInsets.all(40),
                color: const Color.fromRGBO(30, 33, 33, 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nickname,
                      style: TextStyle(
                        color: Color.fromARGB(255, 252, 172, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                     receptor_account,
                      style: TextStyle(
                        color:Color.fromARGB(255, 170, 170, 170),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Concepto",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      concepto,
                      style: TextStyle(
                        color: Color.fromARGB(255, 170, 170, 170),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Clave de rastreo",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      numeroRatreo,
                      style: TextStyle(
                        color:Color.fromARGB(255, 170, 170, 170),
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share, color: Colors.orange),
                        SizedBox(width: 5),
                        Text(
                          "Compartir",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                      Navigator.pushNamed(context, "/transferencia");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(242, 254, 141, 1),
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Volver",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
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
