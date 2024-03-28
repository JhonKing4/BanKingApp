import 'package:bankingapp/core/presentation/screens/home.dart';
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
  @override
  _Tranferencia2State createState() => _Tranferencia2State();
}

class _Tranferencia2State extends State<Tranferencia2> {
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
            SizedBox(height: 20),
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
            SizedBox(height: 30),
            Text(
              "S 150.00",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            SizedBox(width: 20),
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
                      SizedBox(
                          height:
                              5), // Espacio entre el texto y la fecha
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
                 SizedBox(width: 20),
              ],
            ),
           
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
            SizedBox(height: 20), // Espacio entre el botón y el contenedor de botones
            NumberPadContainer(), // Aquí se agrega el contenedor de botones con números
          ],
        ),
      ),
    );
  }
}

class NumberPadContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('1'),
              SizedBox(height: 30),
              _buildNumberButton('2'),
              SizedBox(height: 30),
              _buildNumberButton('3'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('4'),
              SizedBox(height: 30),
              _buildNumberButton('5'),
              SizedBox(height: 30),
              _buildNumberButton('6'),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNumberButton('7'),
              SizedBox(height: 30),
              _buildNumberButton('8'),
              SizedBox(height: 30),
              _buildNumberButton('9'),
            ],
          ),
          SizedBox(height: 20),
          // Additional row for number 0
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildNumberButton('0'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 78, 78, 78),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0,
          ),
        ),
      ),
    );
  }
}
