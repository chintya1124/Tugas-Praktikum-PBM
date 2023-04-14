import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/register_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  dynamic _bmi = 0.0;

  String _result = '';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var nama = arguments?['nama'];

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI App'),
          backgroundColor: Color.fromARGB(255, 65, 150, 68),
          centerTitle: true,
        ),
        body: Container(
          color: Color.fromARGB(255, 70, 204, 74),
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hallo, ${nama}',
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'times new roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 50,
                  ),
                  Text('Hasil :${_bmi}',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'times new roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('${_result}',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'times new roman',
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Tinggi Badan',
                      hintText: 'Masukkan Tinggi Badan Anda (cm)',
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Berat Badan',
                        hintText: 'Masukkan Berat Badan Anda (kg)',
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        double height = double.parse(_heightController.text);
                        double weight = double.parse(_weightController.text);
                        double number =
                            weight / ((height / 100) * (height / 100));

                        if (number < 18.5) {
                          _result = 'Kekurangan berat badan';
                          _bmi = number.toStringAsFixed(1);
                        } else if (number >= 18.5 && number < 24.9) {
                          _result = 'Normal';
                          _bmi = number.toStringAsFixed(1);
                        } else if (number >= 25.0 && number < 29.9) {
                          _result = 'Kelebihan berat badan';
                          _bmi = number.toStringAsFixed(1);
                        } else {
                          _result = 'Kegemukan(Obesitas)';
                          _bmi = number.toStringAsFixed(1);
                        }
                      });
                    },
                    child: Text('Hitung Nilai BMI'),
                    style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll(Size(500, 50)),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber)),
                  )),
                ],
              ),
            ),
          ),
        ));
  }
}
