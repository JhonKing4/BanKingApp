import 'package:bankingapp/core/presentation/bloc/usuarios_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_event.dart';
import 'package:bankingapp/core/presentation/bloc/usuarios_state.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/entities/usuariosModel.dart';
import 'package:bankingapp/core/presentation/screens/data/domain/usecases/load_usuarios_data.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController rfcController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController idBankController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userRepository = RegisterRepositoryImpl();
    final submitUser = SubmitRegister(userRepository);
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit User Data'),
      ),
      body: Center(
        child: BlocProvider(
        create: (context) => RegisterBloc(submitUser),
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (state is RegisterInitial) {
              return buildForm(context);
            } else if (state is RegisterLoading) {
              return CircularProgressIndicator();
            } else if (state is RegisterSuccess) {
              return Text('Register data submitted successfully');
            } else if (state is RegisterError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message),
                  SizedBox(height: 16),
                  buildForm(context),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: lastnameController,
            decoration: InputDecoration(labelText: 'Lastname'),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: rfcController,
            decoration: InputDecoration(labelText: 'RFC'),
          ),
          TextField(
            controller: phoneController,
            decoration: InputDecoration(labelText: 'Phone'),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          TextField(
            controller: idBankController,
            decoration: InputDecoration(labelText: 'ID Bank'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final user = UsuariosModel(
                name: nameController.text,
                lastname: lastnameController.text,
                email: emailController.text,
                rfc: rfcController.text,
                phone: phoneController.text,
                password: passwordController.text,
                id_bank: int.parse(idBankController.text),
              );
              BlocProvider.of<RegisterBloc>(context).add(SubmitRegisterEvent(user));
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}