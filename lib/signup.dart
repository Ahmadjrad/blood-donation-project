import 'package:flutter/material.dart';
import 'package:pproject/donor.dart';
import 'package:pproject/thankpage.dart';
import 'package:pproject/bloodtype.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signinState();
}

List<String> options = [ 'Male', 'Female'];

class _signinState extends State<signup> {

  TextEditingController controllerfn  = TextEditingController();
  TextEditingController controlleremail  = TextEditingController();
  TextEditingController controllerphone = TextEditingController();
  String currentoption = options[0];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              'Donate Blood!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),



            TextFormField(
              decoration: InputDecoration(labelText: 'Enter you Full Name'),

              controller: controllerfn,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Male',
                      textAlign: TextAlign.start,

                    ),
                    leading: Radio(
                      value: options[0],
                      groupValue: currentoption,
                      onChanged: (value) {
                        setState(() {
                          currentoption = value.toString();
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Female',
                      textAlign: TextAlign.start,
                    ),
                    leading: Radio(
                      value: options[1],
                      groupValue: currentoption,
                      onChanged: (value) {
                        setState(() {
                          currentoption = value.toString();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 5),
            TextFormField(
              decoration: InputDecoration(labelText:  'Email'),
              controller: controlleremail,

            ),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.number,
              controller: controllerphone,
            ),
            SizedBox(height: 10),

            SizedBox(height: 10),
            Text('choose your blood type',style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            DropdownMenu(
              width: 210,
              dropdownMenuEntries:
              Types.map<DropdownMenuEntry<Type>>((Type type) {
                return DropdownMenuEntry(
                    value: type, label: type.type.toString());
              }).toList(),
              initialSelection: Types[0],

            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: ()  {
                try {
                  String fn = controllerfn.text;
                  String email = controlleremail.text;
                  String phone = controllerphone.text;
                  donor don = donor(fn,email,phone);


                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => thank(),
                        settings: RouteSettings(arguments: don),
                      )
                  );
                }catch(e){
                  print(e);
                }
              },
              child: Text('Submit '),
            ),
          ],
        ),
      ),
    );
  }
}
