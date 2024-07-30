import 'package:bankingapp/core/presentation/bloc/Contacts/contact_state.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_event.dart';
import 'package:bankingapp/core/presentation/bloc/transferencia_contacto/transferencia_account_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_transferencias/transferencia_accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_transferencia_account_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/transferencia_account_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Transferencia_cuenta extends StatefulWidget {
  @override
  _Transferencia_cuentaPageState createState() =>
      _Transferencia_cuentaPageState();
}

class _Transferencia_cuentaPageState extends State<Transferencia_cuenta> {
  final TextEditingController Receptor_accountController =
      TextEditingController();
  final TextEditingController amountController = TextEditingController();

  bool isReceptor_accountValid = true;
  bool isamountValid = true;

  @override
  Widget build(BuildContext context) {
    final userRepository = TransferenciaAccountRepositoryImpl();
    final submitUser = SubmitRegisterTransfer(userRepository);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: Center(
        child: BlocProvider(
          create: (context) => TransferenciaAmountBloc(submitUser),
          child:
              BlocListener<TransferenciaAmountBloc, TransferenciaAmountState>(
            listener: (context, state) {
              if (state is TrasferenciaSuccess) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Éxito"),
                      content: Text("La transferencia se concreto con exito"),
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
            child:
                BlocBuilder<TransferenciaAmountBloc, TransferenciaAmountState>(
              builder: (context, state) {
                if (state is RegisterInitial) {
                  return buildForm(context);
                } else if (state is RegisterLoading) {
                  return CircularProgressIndicator();
                } else {
                  return buildForm(
                      context); // Default to showing the form in other states
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(60.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
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
              ],
            ),
            Text(
              "Hacer una transferencia a una cuenta",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 80),
            const SizedBox(height: 20),
            buildTextField(context, "Cuenta del receptor",
                Receptor_accountController, false, isReceptor_accountValid),
            const SizedBox(height: 20),
            buildTextField(
                context, "Cantidad", amountController, false, isamountValid),
            const SizedBox(height: 20),
            SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isReceptor_accountValid =
                      Receptor_accountController.text.isNotEmpty;
                  isamountValid = amountController.text.isNotEmpty &&
                      double.tryParse(amountController.text)! > 0;
                });

                if (isReceptor_accountValid && isamountValid) {
                  final contact = transferencia_accountModel(
                    user_account: '0117330545185950',
                    receptor_account: Receptor_accountController.text,
                    amount: double.tryParse(amountController.text),
                  );
                  BlocProvider.of<TransferenciaAmountBloc>(context)
                      .add(SubmitRegisterTransferEvent(contact));
                }
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
                  "Aceptar",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(BuildContext context, String hintText,
      TextEditingController controller, bool obscureText, bool isValid,
      [TextInputType keyboardType = TextInputType.text]) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
        filled: true,
        fillColor: const Color.fromRGBO(30, 33, 33, 1),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: isValid ? Color.fromRGBO(255, 223, 0, 1) : Colors.red),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorText: isValid ? null : 'Este campo es obligatorio',
      ),
      style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
