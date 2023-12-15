import 'package:flutter/material.dart';
import 'people.dart';

class listp extends StatefulWidget {
  const listp({super.key});

  @override
  State<listp> createState() => _listpState();
}

class _listpState extends State<listp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list of people who donate'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Donors :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: Types.length,
                itemBuilder: (context, index) {
                  final list = Types[index];
                  return listofpeople(
                    list.name,
                    list.bloodtype,
                    list.email,
                    list.number,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class listofpeople extends StatelessWidget {
  String name;
  String bloodtype;
  String email ;
  int number ;

  listofpeople(this.name, this.bloodtype,this.email,this.number) ;

  @override
  Widget build(BuildContext context) {
    if (name.isEmpty) {
      return Container();
    }
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.brown),
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          Text(
            'Name: $name',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          SizedBox(height: 8),
          Text('BloodType: $bloodtype',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue)),
          Text(
            'Email: $email',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          Text(
            'Number: $number',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
        ],
      ),
    );
  }
}
