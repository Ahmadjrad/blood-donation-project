import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _baseURL = 'http://10.0.2.2:80/CSCI410DataBase';

List<String> _customers = [];

Future<void> updateCustomers() async {
  try {
    final url = Uri.parse('$_baseURL/getProducts.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    _customers.clear();

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      for (var row in jsonResponse) {
        _customers.add("id: ${row['id']} name: ${row['name']} email: ${row['email']} phone: ${row['phone']} type: ${row['type']}");
      }
    }
  } catch (e) {
    print('Error updating customers: $e');
  }
}

class ShowCustomers extends StatefulWidget {
  const ShowCustomers({Key? key}) : super(key: key);

  @override
  State<ShowCustomers> createState() => _ShowCustomersState();
}

class _ShowCustomersState extends State<ShowCustomers> {
  @override
  void initState() {
    super.initState();
    updateCustomers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Available Customers"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                updateCustomers();
              });
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _customers.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: Colors.red),
          ),
          elevation: 3,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Donors Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  ' ${_customers[index]}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                // Add more Text widgets for other customer information
              ],
            ),
          ),
        ),
      ),

    );
  }
}