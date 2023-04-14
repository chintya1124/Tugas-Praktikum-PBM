import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/login_page.dart';

String username = "";
String password = "";

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'REGISTRASI',
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'monaco',
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                  // fillColor: Colors.white,
                  labelText: 'Email',
                  hintText: 'Masukkan Email',
                  border: OutlineInputBorder()),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Email harus terisi!';
                }
                return null;
              },
              onSaved: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: nama,
              decoration: InputDecoration(
                labelText: 'Username',
                hintText: 'Masukkan Username',
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
              controller: pass,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Masukkan Password',
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
                if (nama.text == '' || email.text == '' || pass.text == '') {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text('Email Atau Password Salah'),
                        );
                      });
                } else {
                  final Map<String, dynamic> data = {
                    'nama': nama.text,
                    'email': email.text,
                    'pass': pass.text
                  };
                  Navigator.pushNamed(context, '/login', arguments: data);
                }
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
    );
  }
}
