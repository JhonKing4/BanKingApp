import 'package:bankingapp/core/presentation/screens/transferencia.dart';
import 'package:bankingapp/main.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Inicio")),
      drawer: NavigationDrawer(),
     bottomNavigationBar: BottomNavigationBar(
  items: const [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        color: Colors.orange,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.credit_card, color: Colors.orange),
      label: "Card",
    ),
  ],
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
                                color: Color.fromARGB(255, 216, 209, 209)),
                          ),
                          Text(
                            "Jhonking@gmail.com",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 82, 79, 79)),
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
