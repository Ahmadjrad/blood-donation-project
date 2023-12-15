import 'package:flutter/material.dart';
import 'donor.dart';

class thank extends StatefulWidget {
  const thank({super.key});

  @override
  State<thank> createState() => _thankState();
}

class _thankState extends State<thank> {
  @override
  Widget build(BuildContext context) {
    donor don = ModalRoute.of(context)!.settings.arguments as donor;
    return Scaffold(
      appBar: AppBar(title: Text('Thank you')),
      body: Column(
        children: [
          Container(
            child: Text(
              'your information : ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(height: 20),
          Container(

            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Name : ' + don.fn,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(height: 20),
          Container(

            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Email : ' + don.email,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(height: 20),
          Container(

            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              'Phone number : ' + don.phone,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
          SizedBox(height: 50),
          Container(
            alignment: Alignment.center,
            child: Text(
              'Thank you , your  donation will save many lives ❤️',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
