import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namaV = TextEditingController();
    TextEditingController passV = TextEditingController();

    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    var namaIn = arguments?['nama'];
    var emailIn = arguments?['email'];
    var passIn = arguments?['pass'];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          color: Color.fromARGB(255, 70, 204, 74),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'LOGIN',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'monaco',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                    'Welcome Back!',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'monaco',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ))),
              SizedBox(
                height: 70,
              ),
              TextFormField(
                controller: namaV,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Masukkan Username Anda',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Username harus terisi!';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passV,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Masukkan Password Anda',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password harus terisi!';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  if (namaV.text != namaIn || passV.text != passIn) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Email Atau Password Salah'),
                          );
                        });
                  } else {
                    Navigator.pushNamed(context, '/home',
                        arguments: {'nama': namaIn});
                  }
                },
                child: Text('Login'),
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(500, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              )),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/register',
                  );
                },
                child: Text('Sign Up'),
                style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(500, 50)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                    backgroundColor: MaterialStatePropertyAll(Colors.amber)),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
