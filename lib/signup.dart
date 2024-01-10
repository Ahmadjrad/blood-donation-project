import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


const String _baseURL = 'http://10.0.2.2:80/CSCI410DataBase';


class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<signup> {
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  List<String> dropdownItems = ['A+', 'A -', 'B+ ','B', 'O+', 'O-'];
  String selectedDropdownItem = 'A+';

  bool _loading = false;

  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Please Fill The Info Below',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                child: TextField(
                  controller: _controllerName,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                child: TextField(
                  controller: _controllerEmail,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                child: TextField(
                  controller: _controllerPhone,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 18),


              SizedBox(
                width: 200,
                child: DropdownButtonFormField<String>(
                  value: selectedDropdownItem,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDropdownItem = newValue!;
                    });
                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                    labelText: "Select your blood type",

                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _loading = true;
                  });
                  saveDataToDatabase(
                    update,
                    _controllerName.text,
                    _controllerEmail.text,
                    _controllerPhone.text,
                    selectedDropdownItem,
                  );
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 0),
              Visibility(
                visible: _loading,
                child: const CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDataToDatabase(
    Function(String text) update,
    String name,
    String email,
    String phone,
    String selectedDropdownItem,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse('$_baseURL/save.php'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: convert.jsonEncode(
              <String, String>{
                'name': name,
                'email': email,
                'phone': phone,
                'type': selectedDropdownItem,
              },
            ),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        update(response.body);
      }
    } catch (e) {
      update("Connection error");
    }
  }
}
