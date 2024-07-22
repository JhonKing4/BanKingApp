import 'package:flutter/material.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/servicioModel.dart';

class ServicioModal extends StatelessWidget {
  final servicioModel servicio;

  const ServicioModal({Key? key, required this.servicio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: const Color.fromRGBO(30, 33, 33, 1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  servicio.name,
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                  Text(
                  'Su saldo diponible actualmente es de: ' ,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                                  Text(
                  '\$ 7896.54' ,
                  style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 219, 199, 17), fontWeight: FontWeight.bold),
                ),
                    ],
                  ),

                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Monto',
                    labelStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.grey[800],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                  Text(
                  '¿Esta seguro que quiere pagar el siguiente servicio?' ,
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
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
                        "Aceptar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
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
