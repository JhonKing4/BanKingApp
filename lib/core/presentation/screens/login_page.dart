import 'package:bankingapp/core/presentation/screens/home.dart';
import 'package:bankingapp/core/presentation/screens/registro.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:local_auth/local_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  bool _isChecked = false;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final LocalAuthentication _localAuthentication = LocalAuthentication();

    Future<void> _auth() async {
      bool authenticated = false;
      try {
        authenticated = await _localAuthentication.authenticate(
            localizedReason: "Autenticate para acceder",
            options: const AuthenticationOptions(
                stickyAuth: true, useErrorDialogs: true));
      } catch (e) {
        print(e);
      }
      if (authenticated) {
        Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => HomeView()));
      } else {
        print("Fallo auth");
      }
    }

    return Column(
      children: <Widget>[
        ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset("assets/images/vertical.png")),
        TextField(
          controller: _phoneController,
          decoration: InputDecoration(
            hintText: "Phone number",
            hintStyle: TextStyle(
                color:
                    const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
            filled: true,
            fillColor: const Color.fromRGBO(30, 33, 33, 1),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          ),
          style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(
                color:
                    const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
            filled: true,
            fillColor: const Color.fromRGBO(30, 33, 33, 1),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
          ),
          style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (newValue) => {setState(() => _isChecked = newValue!)},
              checkColor: const Color.fromRGBO(255, 223, 0, 1),
              fillColor: MaterialStateProperty.all(
                  const Color.fromRGBO(30, 33, 33, 1)),
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            const Text("Mantener sesion activa",
                style: TextStyle(color: Color.fromRGBO(255, 223, 0, 80))),
          ],
        ),
        ElevatedButton(
          onPressed: () async {
            String url = "https://apimoviles-production.up.railway.app/auth/login";
            String phoneNumber = _phoneController.text;
            String password = _passwordController.text;

            Map<String, dynamic> data = {
              "phone": phoneNumber,
              "password": password
            };

            try {
              Response response = await Dio().post(url, data: data);
              if (response.statusCode == 200) {
                String token = response.data['access_token'];
                print("Token recibido: $token");
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('authToken', token);
                Navigator.pushNamed(context, "/home");
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text(response.statusMessage.toString()),
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
            } catch (e) {
              print("Error en el login: $e");
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Error"),
                    content: Text(e.toString()),
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
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
            child: const Text(
              "Login",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registro");
          },
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(0, 37, 37, 37)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
            child: const Text(
              "Registro",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () => _auth(),
          icon: const Icon(Icons.fingerprint,
              color: Color.fromRGBO(242, 254, 141, 1), size: 32),
        ),
      ],
    );
  }
}
