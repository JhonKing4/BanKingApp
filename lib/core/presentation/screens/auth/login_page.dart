import 'package:bankingapp/core/presentation/bloc/login/login_bloc.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_event.dart';
import 'package:bankingapp/core/presentation/bloc/login/login_state.dart';
import 'package:bankingapp/core/presentation/screens/casa.dart';
import 'package:bankingapp/core/presentation/screens/data/repositories/usuarios_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import '../widgets/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LocalAuthentication _localAuthentication = LocalAuthentication();
  bool _passwordVisible = false;

  bool isPhoneValid = true;
  bool isPasswordValid = true;

  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: "Authenticate to access",
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => CasaView(),
        ),
      );
    } else {
      print("Authentication failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, "/casa");
          });
          return Container();
        } else if (state is UserFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<UserBloc>(context)
                          .add(UserFailureHandledEvent());
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              ),
            );
          });
          return Container(); // Evitar renderizar la vista en este estado
        } else if (state is UserFailureHandled) {
        } else if (state is UserLoggedOut) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (Route<dynamic> route) => false);
          });
          return Container();
        } else if (state is UserSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, "/casa");
          });
          return Container();
        } else if (state is UserFailure) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.error),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Aceptar"),
                  ),
                ],
              ),
            );
          });
        } else if (state is UserLoggedOut) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (Route<dynamic> route) => false);
          });
          return Container();
        }

        return SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  16, // Añadir 16 píxeles adicionales
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset("assets/images/vertical.png"),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        isPhoneValid = value.isNotEmpty && value.length > 9;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 207, 203, 203)
                            .withOpacity(0.7),
                      ),
                      filled: true,
                      fillColor: const Color.fromRGBO(30, 33, 33, 1),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorText: isPhoneValid
                          ? null
                          : _phoneController.text.isEmpty
                              ? 'El número de teléfono no puede estar vacío'
                              : _phoneController.text.length != 9
                                  ? 'Debe tener 9 caracteres el telefono'
                                  : 'El número de teléfono no es válido',
                    ),
                    style:
                        const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    onChanged: (value) {
                      setState(() {
                        isPasswordValid = value.isNotEmpty;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(30, 33, 33, 1),
                      hintText: "Contraseña",
                      hintStyle: TextStyle(
                        color: const Color.fromARGB(255, 207, 203, 203)
                            .withOpacity(0.7),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color.fromRGBO(255, 223, 0, 1),
                          size: 20,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      errorText: isPasswordValid
                          ? null
                          : 'La contraseña no puede estar vacia',
                    ),
                    style:
                        const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (newValue) =>
                            setState(() => _isChecked = newValue!),
                        checkColor: const Color.fromRGBO(255, 223, 0, 1),
                        fillColor: MaterialStateProperty.all(
                            const Color.fromRGBO(30, 33, 33, 1)),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color.fromRGBO(255, 223, 0, 1),
                              width: 2.0),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      const Text(
                        "Mantenerme logeado",
                        style:
                            TextStyle(color: Color.fromRGBO(255, 223, 0, 0.8)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isPhoneValid = _phoneController.text.isNotEmpty &&
                            _phoneController.text.length > 9;
                        isPasswordValid = _passwordController.text.isNotEmpty;
                      });
                      if (isPhoneValid && isPasswordValid) {
                        BlocProvider.of<UserBloc>(context)
                            .add(LoginButtonPressed(
                          _phoneController.text,
                          _passwordController.text,
                        ));
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
                        "Login",
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/registro");
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(0, 37, 37, 37)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 0),
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _auth,
                    icon: const Icon(
                      Icons.fingerprint,
                      color: Color.fromRGBO(242, 254, 141, 1),
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
