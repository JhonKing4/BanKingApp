import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/main.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      appBar: AppBar(
        toolbarHeight: 1,
        title: const Text("Inicio"),
        backgroundColor:
             const Color.fromRGBO(30, 33, 33, 1), // Cambia este color según tus preferencias
      ),
      drawer: NavigationDrawer(),
      body: Column(
        // Agregar un Column para envolver los widgets
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Image.asset(
              "assets/images/horizontal.png",
              width: 120,
              height: 90,
            ),
          ),
           Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Ajusta la alineación del texto a la izquierda
        children: [
          Text('BALANCE GENERAL', style: TextStyle(fontSize: 12, color: Colors.white)), // Corrige la sintaxis de TextStyle
          Text('\$7,896.00', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)), // Corrige la sintaxis de TextStyle
        ],
      ),
    ),
  ],
),

          
          SizedBox(width: 5),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/visapng.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Text('saldo', style: TextStyle(color: Colors.white)),
                        Text('\$2,231.00',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 20),
                        Text('*** 56478',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(55.0),
                      backgroundColor: Color.fromARGB(255, 115, 157, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/visapng.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Text('saldo', style: TextStyle(color: Colors.white)),
                        Text('\$5,566.00',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(height: 20),
                        Text('*** 77649',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(55.0),
                      backgroundColor: Color.fromARGB(255, 255, 206, 83),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/visapng.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(height: 10),
                        Text('saldo', style: TextStyle(color: Colors.white)),
                        Text('\$0.00', style: TextStyle(color: Colors.white)),
                        SizedBox(height: 20),
                        Text('*** 11223',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(55.0),
                      backgroundColor: Color.fromARGB(255, 182, 108, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('FINANZAS', style: TextStyle(color: Colors.white)),
              )
            ],
          ),

          const SizedBox(
              height: 5), // Espacio entre el Row y los nuevos botones
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star_border_outlined,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(height: 5),
                        Text('TRANSFERIR', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                     padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.money_outlined,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(height: 5),
                        Text('RETIRAR', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.gradient_sharp,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(height: 5),
                        Text('MOVIMIENTOS', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.person_2_outlined,
                            color: Color.fromARGB(255, 255, 255, 255)),
                        SizedBox(height: 5),
                        Text('CONTACTOS', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('PAGO DE SERVICIOS',
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
          const SizedBox(
              height: 5), // Espacio entre el Row y los nuevos botones
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
              "assets/images/Logo_Izzi.png",
              height: 20,
            ),
                        SizedBox(height: 5),
                        Text('IZZI', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
              "assets/images/cfe.png",
              height: 20,
            ),
                        SizedBox(height: 5),
                        Text('CFE', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
              "assets/images/infonavit.png",
              height: 20,
            ),
                        SizedBox(height: 5),
                        Text('INFONAVIT', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
              "assets/images/attt.png",
              height: 20,
            ),
                        SizedBox(height: 5),
                        Text('ATT&T', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
              "assets/images/mercadolobre.png",
              height: 20,
            ),
                        SizedBox(height: 5),
                        Text('MERCADO LIBRE', style: TextStyle(fontSize: 10, color: Colors.white))
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      backgroundColor: Color.fromARGB(255, 52, 52, 52),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home_outlined,
              color: Colors.orange,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined, color: Colors.white),
            label: "Card",
          ),
        ],
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Tranferencia()),
            );
          }
        },
      ),
      
    );
    
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://media.istockphoto.com/id/1482806682/es/foto/toma-de-establecimiento-del-estadio-de-f%C3%BAtbol-vac%C3%ADo-socer-concepto-de-torneo-internacional-una.webp?b=1&s=170667a&w=0&k=20&c=h0-PiqG8CcAM2RA3a6M2clnozKCH-vVFI3pLzvqt8dU="),
                          fit: BoxFit.cover)),
                  child: const Row(
                    children: [
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                "https://i.guim.co.uk/img/media/2b711d7538b8c5b2dd1b8a7cb1521d0b90f1a67c/514_499_4477_2688/master/4477.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=85aec0efa60ec554fec7a9ae1e3f773f"),
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Jhonking",
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                          Text(
                            "Jhonking@gmail.com",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Inicio"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text("Notificacion"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.payments_sharp),
                  title: const Text("Movimientos"),
                  onTap: () {},
                ),
                ExpansionTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Configuracion"),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.manage_accounts),
                      title: const Text("Mi cuenta"),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.help),
                      title: const Text("Ayuda"),
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Salir"),
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const MyApp()))),
        ],
      ),
    );
  }
}
