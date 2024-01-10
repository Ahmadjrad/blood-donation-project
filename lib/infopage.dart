import 'package:flutter/material.dart';
import 'bloodtype.dart';

class infopage extends StatefulWidget {
  const infopage({super.key});

  @override
  State<infopage> createState() => _infopageState();
}

class _infopageState extends State<infopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blood Types Information'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Blood Types Information :',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: Types.length,
                itemBuilder: (context, index) {

                  final bloodType = Types[index];
                  return BloodType(
                    bloodType.type,
                     bloodType.description,
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

class BloodType extends StatelessWidget {
   String bloodType;
   String description;

  BloodType(this.bloodType,  this.description);

  @override
  Widget build(BuildContext context) {

    if(bloodType.isEmpty) {
      return Container();
    }
    return Container(

      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            'Blood Type $bloodType',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.green),
          ),
          SizedBox(height: 8),
          Text(description,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold ,color: Colors.blue)),
        ],
      ),
    );
  }
}
