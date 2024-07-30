import 'package:bankingapp/core/presentation/bloc/servicios/pagoServicio_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/pagoServicio_event.dart';
import 'package:bankingapp/core/presentation/bloc/servicios/pagoServicio_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_accounts/accountModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/pagoServicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_servicios/servicioModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/Modelo_usuarios/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/repositories/pagoServicio_repository.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_pagoservicio_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/pagoServicio_repository_impl.dart';
import 'package:bankingapp/core/presentation/screens/widgets/home.dart';
import 'package:bankingapp/core/presentation/screens/widgets/valuenotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicioModal extends StatefulWidget {
  final servicioModel servicio;
  final AccountModel account;

  const ServicioModal({Key? key, required this.servicio, required this.account})
      : super(key: key);

  @override
  _ServicioModalState createState() => _ServicioModalState();
}

class _ServicioModalState extends State<ServicioModal> {
  final TextEditingController amountController = TextEditingController();
  bool isAmountValid = true;

  @override
  Widget build(BuildContext context) {
    final pagoRepository = PagoServicioRepositoryImpl();
    final pago = SubmitPago(pagoRepository);

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: BlocProvider(
        create: (context) => PagoServicioBloc(pago),
        child: BlocListener<PagoServicioBloc, PagoServicioState>(
          listener: (context, state) {
            if (state is PagoServicioSuccess) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Éxito"),
                    content: Text('${state.message} ${state.reference}'),
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
            } else if (state is PagoServicioError) {
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
          child: BlocBuilder<PagoServicioBloc, PagoServicioState>(
            builder: (context, state) {
              if (state is PagoServicioInitial) {
                return buildForm(context);
              } else if (state is PagoServicioLoading) {
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
  return ClipRRect(
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
    child: Container(
      color: const Color.fromRGBO(30, 33, 33, 1),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  // Acción al tocar el elemento
                },
                child: Container(
                  width: 60,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              widget.servicio.name,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'El balance de su cuenta es de: ',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
                Text(
                  " \$ "+widget.account.balance.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 219, 199, 17),
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
             Row(
              children: [
                Text(
                   'Numero de cuenta: ${widget.account.card[0].card.toString()}',
                  style: TextStyle(fontSize: 12, color: const Color.fromARGB(255, 173, 173, 173)),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: amountController,
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
              '¿Está seguro que quiere pagar el siguiente servicio?',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isAmountValid = amountController.text.isNotEmpty;
                  });

                  if (isAmountValid) {
                    final reference = generateReference();
                    final pago = PagoServicioModel(
                      id_service: widget.servicio.id.toString(),
                      id_users: widget.account.id_user.toString(),
                      id_account: widget.account.card[0].id_account.toString(),
                      amount: amountController.text.toString(),
                      reference: reference,
                    );
                    BlocProvider.of<PagoServicioBloc>(context)
                        .add(BotonPagoServicioEvent(pago));
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
            ),
          ],
        ),
      ),
    ),
  );
}

}
