import 'package:bankingapp/core/presentation/bloc/Account/account_event.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_event.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/home_blocs/home_event.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_home_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/home_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_contacto.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_cuenta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Account/account_state.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/Contacts/contact_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_contacts/contactsModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_contact_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/contacts_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/widgets/appbar.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';

class Transferencia extends StatefulWidget {
  const Transferencia({Key? key}) : super(key: key);

  @override
  _TransferenciaState createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  int _currentIndex = 1;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ContactsBloc(LoadContactsData(ContactRepositoryImpl()))
                ..add(LoadContactsDataEvent()),
        ),
        BlocProvider(
          create: (context) =>
              AccountBloc(LoadAccountData(AccountRepositoryImpl()))
                ..add(LoadAccountDataEvent()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(LoadHomeData(HomeRepositoryImpl()))
            ..add(LoadHomeDataEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: BlocBuilder<ContactsBloc, ContactsState>(
          builder: (context, contactsState) => SingleChildScrollView(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, accountState) {
                    final hasCard = accountState.card.isNotEmpty;
                    final myAccount =
                        hasCard ? accountState.card[0].card.toString() : '';
                    final balance = accountState.balance.toString();

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Transferencias',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Text(
                          "Balance",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '\$ ${balance}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 20),
                        TransferenciaWidget(
                          contacts: contactsState.contacts,
                          myaccount: myAccount,
                          balance: balance,
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (hasCard) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Transferencia_cuenta(
                                    user_account: myAccount,
                                    balance: accountState.balance,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.account_balance_wallet,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                              SizedBox(height: 5),
                              Text('TRANSFERIR A UNA CUENTA',
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white))
                            ],
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 52, 52, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ContactsWidget(
                          contacts: contactsState.contacts,
                          onContactTap: (contact) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Tranferencia2(
                                  id: contact.id.toString(),
                                  idUser: contact.id_user.toString(),
                                  nickname: contact.nickname,
                                  receptor_account: contact.account,
                                  sende_account: myAccount,
                                  balance: balance,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}

class TransferenciaWidget extends StatelessWidget {
  final List<ContactsModel> contacts;
  final String myaccount;
  final String balance;

  const TransferenciaWidget({
    Key? key,
    required this.myaccount,
    required this.contacts,
    required this.balance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 204, 239, 255),
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    contacts.take(3).length,
                    (index) {
                      final contact = contacts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Tranferencia2(
                                id: contact.id.toString(),
                                idUser: contact.id_user.toString(),
                                nickname: contact.nickname,
                                receptor_account: contact.account,
                                sende_account: myaccount,
                                balance: balance,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/users.png',
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(height: 4),
                            Text(
                              contact.nickname,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/register_contact");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/plus.png',
                      width: 40,
                      height: 40,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Agregar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 30),
            ],
          ),
        ],
      ),
    );
  }
}

class ContactsWidget extends StatefulWidget {
  final List<ContactsModel> contacts;
  final void Function(ContactsModel) onContactTap;

  const ContactsWidget({
    Key? key,
    required this.contacts,
    required this.onContactTap,
  }) : super(key: key);

  @override
  _ContactsWidgetState createState() => _ContactsWidgetState();
}

class _ContactsWidgetState extends State<ContactsWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 900));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 20),
          widget.contacts.isNotEmpty
              ? Column(
                  children: List.generate(widget.contacts.length, (index) {
                    final contact = widget.contacts[index];
                    return GestureDetector(
                      onTap: () => widget.onContactTap(contact),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 60),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              'assets/images/users.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  contact.nickname,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      color: Colors.green,
                                      size: 16,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      contact.account,
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
                    );
                  }),
                )
              : Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(0.0),
                      child: FadeTransition(
                        opacity: _animation,
                        child: Text(
                          textAlign: TextAlign.center,
                          'Agrega nuevos contactos',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 184, 184, 184),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/register_contact");
                      },
                      child: FadeTransition(
                        opacity: _animation,
                        child: Icon(
                          Icons.add,
                          color: const Color.fromARGB(255, 184, 184, 184),
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(height: 300),
                  ],
                ),
        ],
      ),
    );
  }
}
