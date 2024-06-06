import 'package:bankingapp/core/presentation/screens/login_page.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromRGBO(30, 33, 33, 1),
      body: Padding(
        
        padding: const EdgeInsets.all(60.0),
        child: SingleChildScrollView(
          
          child: Column(
            
            children: <Widget>[
              const SizedBox(height: 10),
              
              TextField(
                
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _name),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Lastname",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _lastname),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _email),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "RFC",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _rfc),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Phone number",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _phoneNumber),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 207, 203, 203)
                          .withOpacity(0.7)),
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
                controller: TextEditingController(text: _password),
                obscureText: true,
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
                onPressed: () {
                  Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
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
