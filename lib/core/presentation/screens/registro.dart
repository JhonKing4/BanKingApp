import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends State<RegisterPage> {
  bool _isChecked = false;
  String _name = "";
  String _lastname = "";
  String _email = "";
  String _rfc = "";
  String _phoneNumber = "";
  String _password = "";

  final Dio _dio = Dio(); 


  Future<void> _register() async {
    final String apiUrl = "https://mollusk-safe-openly.ngrok-free.app/"; 

    try {
      final response = await _dio.post(apiUrl, data: {
        "name": _name,
        "lastname": _lastname,
        "email": _email,
        "rfc": _rfc,
        "phone": _phoneNumber,
        "password": _password,
      });

      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Exception: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 33, 33, 1),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/");
                        },
                        icon: Stack(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 44, 44, 44), // Color del círculo más claro
                              ),
                            ),
                            Positioned(
                              left: 7, // Ajusta la posición de la flecha según sea necesario
                              top: 9, // Ajusta la posición de la flecha según sea necesario
                              child: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color.fromARGB(255, 255, 255, 255), // Color de la flecha
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Lastname",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                onChanged: (value) {
                  setState(() {
                    _lastname = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "RFC",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                onChanged: (value) {
                  setState(() {
                    _rfc = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                onChanged: (value) {
                  setState(() {
                    _phoneNumber = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(color: const Color.fromARGB(255, 207, 203, 203).withOpacity(0.7)),
                  filled: true,
                  fillColor: const Color.fromRGBO(30, 33, 33, 1),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(color: Color.fromRGBO(255, 223, 0, 1)),
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) {
                      setState(() {
                        _isChecked = newValue!;
                      });
                    },
                    checkColor: const Color.fromRGBO(255, 223, 0, 1),
                    fillColor: MaterialStateProperty.all(const Color.fromRGBO(30, 33, 33, 1)),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Color.fromRGBO(255, 223, 0, 1), width: 2.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  const Text("Mantener sesión activa",
                      style: TextStyle(color: Color.fromRGBO(255, 223, 0, 80))),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _register, // Call the register function
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(242, 254, 141, 1)),
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
                    "Register",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
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
