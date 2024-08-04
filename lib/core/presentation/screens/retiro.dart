import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/mis_tarjetas.dart';
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
    'Retiro de efectivo',
    'por monto de: \$1,000',
    platformChannelSpecifics,
    payload: 'payload',
  );
}

class RetiroPage extends StatefulWidget {
  final String my_account;
  final String balance;

  const RetiroPage({
    Key? key,
    required this.my_account,
    required this.balance,
  }) : super(key: key);

  @override
  _RetiroPage createState() => _RetiroPage();
}

class _RetiroPage extends State<RetiroPage> {
  final TextEditingController amountController = TextEditingController();
  bool isamountValid = true;

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
                        Navigator.pushNamed(context, "/mistarjetas");
                      },
                      icon: Stack(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 44, 44,
                                  44), // Color del círculo más claro
                            ),
                          ),
                          Positioned(
                            left:
                                7, // Ajusta la posición de la flecha según sea necesario
                            top:
                                9, // Ajusta la posición de la flecha según sea necesario
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(
                                  255, 255, 255, 255), // Color de la flecha
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
            Text(
              "MONTO A RETIRAR",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30),
           Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "\$",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: amountController,
                          onChanged: (value) {
                            setState(() {
                              isamountValid = value.isNotEmpty &&
                                  double.tryParse(value) != null &&
                                  double.parse(value) > 0 &&
                                  double.parse(value) <=
                                      double.parse(widget.balance);
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color.fromARGB(255, 37, 39, 39),
                            hintText: "Cantidad",
                            hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 207, 203, 203)
                                  .withOpacity(0.7),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isamountValid
                                      ? Colors.yellow
                                      : Colors.red),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: isamountValid
                                      ? Colors.yellow
                                      : Colors.red),
                            ),
                            errorText: isamountValid ? null : 'Monto no válido',
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

            SizedBox(height: 60),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    "assets/images/visa.png",
                    width: 60,
                    height: 60,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.my_account,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 221, 221, 221),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Saldo disponible: \$${widget.balance}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 187, 187, 187),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text('RETIRO DE EFECTIVO',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text(
                                '¿ Esta seguro que desea retirar esta cantidad de: ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                            onTap: () {},
                          ),
                          ListTile(
                            title: Text('VISA **** 7312 ?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                )),
                            onTap: () {},
                          ),
                          ElevatedButton(
                            onPressed: () => _showNotification(),
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 0),
                              child: const Text(
                                "Aceptar",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
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
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                child: const Text(
                  "Retirar",
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
