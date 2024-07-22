import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//Inicializo mi variable global de notificaciones
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializedNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_background');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification() async {
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestExactAlarmsPermission();

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '1',
    'NopalBank',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Tran',
    'Dinero 1000 pesos',
    platformChannelSpecifics,
    payload: 'payload',
  );
}

class Tranferencia2 extends StatefulWidget {
  const Tranferencia2({Key? key}) : super(key: key);

  @override
  _Tranferencia2State createState() => _Tranferencia2State();
}

class _Tranferencia2State extends State<Tranferencia2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: Container(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/transferencia");
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
            SizedBox(height: 10),
            Image.asset(
              "assets/images/martin.png",
              width: 60,
              height: 60,
            ),
            Text(
              "...7865",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              "Adrian 🕹️",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 90,),
                        Container(
                          
                          width: 30,
                          alignment: Alignment.centerRight,
                          child: Text(
                            "\$",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        width: 120, // Ancho deseado del TextField
                        child: TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          autofocus: true,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                SizedBox(width: 120,),
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
                    "assets/images/visa.png",
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
                        "VISA ..6755",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5), // Espacio entre el texto y la fecha
                      // Fecha a la izquierda
                      Row(
                        children: [
                          SizedBox(width: 5),
                          Text(
                            "S 7,896.00",
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
            ElevatedButton(
              onPressed: () => _showNotification(),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                child: const Text(
                  "Enviar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Espacio entre el botón y el contenedor de botones // Aquí se agrega el contenedor de botones con números
          ],
        ),
      ),
    );
  }
}

