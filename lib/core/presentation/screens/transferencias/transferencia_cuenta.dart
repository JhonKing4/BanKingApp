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
  final String user_account;
  final double balance;

  const Transferencia_cuenta({
    Key? key,
    required this.user_account,
    required this.balance,
  }) : super(key: key);

  @override
  _Transferencia_cuentaPageState createState() =>
      _Transferencia_cuentaPageState();
}

class _Transferencia_cuentaPageState extends State<Transferencia_cuenta>
    with SingleTickerProviderStateMixin {
  final TextEditingController Receptor_accountController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController conceptController = TextEditingController();
  final TextEditingController ownerController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _animation;

  bool isReceptor_accountValid = true;
  bool isamountValid = true;
  bool isconceptValid = true;
  bool isownerValid = true;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
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
    final userRepository = TransferenciaAccountRepositoryImpl();
    final submitUser = SubmitRegisterTransfer(userRepository);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: BlocProvider(
        create: (context) => TransferenciaAmountBloc(submitUser),
        child: BlocListener<TransferenciaAmountBloc, TransferenciaAmountState>(
          listener: (context, state) {
            if (state is TrasferenciaSuccess) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Éxito"),
                    content: Text("La transferencia se concretó con éxito"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacementNamed(
                                context, "/transferencia");
                          });
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const SizedBox(height: 70),
          FadeTransition(
            opacity: _animation,
            child: Text(
              textAlign: TextAlign.center,
              'El balance de tu cuenta es actualmente de:',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: _animation,
            child: Text(
              '\$ ${widget.balance.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          FadeTransition(
            opacity: _animation,
            child: Text(
              textAlign: TextAlign.center,
              'Esta transferencia no genera comisión.',
              style: TextStyle(
                fontSize: 12,
                color: const Color.fromARGB(255, 184, 184, 184),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 70),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 39, 39),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
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
                                  double.parse(value) <= widget.balance;
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
                  child: buildTextField(
                    context,
                    "Cuenta del receptor (16)caracteres",
                    Receptor_accountController,
                    false,
                    isReceptor_accountValid,
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
                const SizedBox(height: 20),
                    Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: buildTextFieldOwner(
                    context,
                    "Dueño de la cuenta",
                    ownerController,
                    false,
                    isownerValid,
                  ),
                ),
                const SizedBox(height: 90),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isReceptor_accountValid =
                            Receptor_accountController.text.isNotEmpty &&
                                Receptor_accountController.text.length > 8 && Receptor_accountController.text != widget.user_account;
                        isamountValid = amountController.text.isNotEmpty &&
                            double.tryParse(amountController.text) != null &&
                            double.parse(amountController.text) > 0 &&
                            double.parse(amountController.text) <=
                                widget.balance;
                      isconceptValid = conceptController.text.isNotEmpty &&  conceptController.text.length > 5;
                      isownerValid = ownerController.text.isNotEmpty &&  ownerController.text.length > 3;
                      });

                      if (isReceptor_accountValid && isamountValid && isconceptValid && isownerValid) {
                        final contact = Transferencia_accountModel(
                          user_account: widget.user_account,
                          receptor_account: Receptor_accountController.text,
                          amount: int.tryParse(amountController.text),
                          concept: conceptController.text,
                          owner: ownerController.text,
                        );
                        BlocProvider.of<TransferenciaAmountBloc>(context)
                            .add(SubmitRegisterTransferEvent(contact));
                      }
                    },
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
                ),
                const SizedBox(
                    height: 30), // Ajustar este tamaño según necesidad
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(
    BuildContext context,
    String hintText,
    TextEditingController controller,
    bool obscureText,
    bool isValid, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
          isReceptor_accountValid = value.isNotEmpty &&
          Receptor_accountController.text.length > 15 && Receptor_accountController.text != widget.user_account;
        });
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 37, 39, 39),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        errorText: isValid ? null : 'El campo no es valido',
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      keyboardType: TextInputType.number,
    );
  }


 Widget buildTextFieldConcept(
    BuildContext context,
    String hintText,
    TextEditingController controller,
    bool obscureText,
    bool isValid, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
           isconceptValid = conceptController.text.isNotEmpty &&  conceptController.text.length > 5;
        });
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 37, 39, 39),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        errorText: isValid ? null : 'El campo no es valido',
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
    );
  }


   Widget buildTextFieldOwner(
    BuildContext context,
    String hintText,
    TextEditingController controller,
    bool obscureText,
    bool isValid, [
    TextInputType keyboardType = TextInputType.text,
  ]) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        setState(() {
           isownerValid = ownerController.text.isNotEmpty &&  ownerController.text.length > 3;
        });
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 37, 39, 39),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: isValid ? Colors.yellow : Colors.red),
        ),
        errorText: isValid ? null : 'El campo no es valido',
      ),
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      keyboardType: TextInputType.text,
    );
  }
}





 