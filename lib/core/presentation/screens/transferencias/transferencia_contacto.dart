import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/transferencia_account_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/transferencias/transferencia_vista.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void initializedNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_background');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification(String amount) async {
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
    'BANKING',
    'Enviaste un total de $amount',
    platformChannelSpecifics,
    payload: 'payload',
  );
}

class Tranferencia2 extends StatefulWidget {
  final String id;
  final String idUser;
  final String nickname;
  final String receptor_account;
  final String sende_account;
  final String balance;

  const Tranferencia2({
    Key? key,
    required this.id,
    required this.idUser,
    required this.nickname,
    required this.receptor_account,
    required this.sende_account,
    required this.balance,
  }) : super(key: key);

  @override
  _Tranferencia2State createState() => _Tranferencia2State();
}

class _Tranferencia2State extends State<Tranferencia2> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController conceptController = TextEditingController();

  bool isamountValid = true;
  bool isconceptValid = true;

  @override
  Widget build(BuildContext context) {
    final userRepository = TransferenciaAccountRepositoryImpl();
    final submitUser = SubmitRegisterTransfer(userRepository);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: BlocProvider(
        create: (context) => TransferenciaAmountBloc(submitUser),
        child: BlocListener<TransferenciaAmountBloc, TransferenciaAmountState>(
          listener: (context, state) {
            if (state is TrasferenciaSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransferSuccessView(
                      amount: amountController.text,
                      nickname: widget.nickname,
                      receptor_account: widget.receptor_account,
                      concepto: conceptController.text,
                    ),
                  ),
                );
              });
            } else if (state is TrasferenciaError) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text(state.message),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Aceptar"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: BlocBuilder<TransferenciaAmountBloc, TransferenciaAmountState>(
            builder: (context, state) {
              if (state is TrasferenciaLoading) {
                return Center(child: CircularProgressIndicator());
              } else {
                return buildForm(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: IntrinsicHeight(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: Color.fromARGB(255, 44, 44, 44),
                            ),
                          ),
                          Positioned(
                            left: 7,
                            top: 9,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/users.png",
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        widget.receptor_account,
                        style: TextStyle(
                          color: Color.fromARGB(255, 173, 173, 173),
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        widget.nickname,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: buildTextFieldConcept(
                    context,
                    "Concepto",
                    conceptController,
                    false,
                    isconceptValid,
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
                            widget.sende_account,
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [buildButtonContinue(context)]),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget buildButtonContinue(BuildContext bloc) {
  return InkWell(
    onTap: () {
      bool isAmountValid = amountController.text.isNotEmpty &&
          double.tryParse(amountController.text) != null &&
          double.parse(amountController.text) > 0 &&
          double.parse(amountController.text) <= double.parse(widget.balance);
      bool isConceptValid = conceptController.text.isNotEmpty;

      setState(() {
        isamountValid = isAmountValid;
        isconceptValid = isConceptValid;
      });

      if (isAmountValid && isConceptValid) {
        showModalBottomSheet(
          backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  ListTile(
                    title: const Text(
                      'TRANSFERENCIA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      '¿ Estas seguro que deseas transferir la cantidad de: \$${amountController.text}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'a la cuenta de ${widget.nickname}',
                      style: const TextStyle(
                        color: Color.fromARGB(255, 201, 201, 201),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Transferencia_accountModel newTransferencia =
                          Transferencia_accountModel(
                        user_account: widget.sende_account,
                        receptor_account: widget.receptor_account,
                        amount: int.parse(amountController.text),
                        concept: conceptController.text,
                        owner: widget.nickname,
                      );

                      BlocProvider.of<TransferenciaAmountBloc>(bloc)
                          .add(SubmitRegisterTransferEvent(newTransferencia));
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
      }
    },
    child: Container(
      height: 50,
      width: 300,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(242, 254, 141, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Text(
        "Continuar",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    ),
  );
}

  Widget buildTextFieldConcept(
    BuildContext context,
    String hint,
    TextEditingController controller,
    bool isPassword,
    bool isValid,
  ) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          isconceptValid = value.isNotEmpty;
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(255, 37, 39, 39),
        hintText: hint,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        errorText: isValid ? null : 'Concepto no válido',
      ),
      obscureText: isPassword,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
