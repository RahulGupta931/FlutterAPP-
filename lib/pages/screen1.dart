import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var phone_no;
  var age;
  var department = '';
  var URL = "";
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneNoController = TextEditingController();
  final photoURLController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    ageController.dispose();
    phoneNoController.dispose();
    photoURLController.dispose();
    super.dispose();
  }

  clearText() {
    nameController.clear();
    ageController.clear();
    phoneNoController.clear();
    photoURLController.clear();
  }

  // Adding Student
  CollectionReference students =
      FirebaseFirestore.instance.collection('flutter-CRUD');

  Future<void> addUser() {
    return students
        .add({
          'Name': name,
          'Age': age,
          'Phone no': phone_no,
          'Department': dropdownValue,
          'Profile photo': URL,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  List<String> items = <String>[
    'Select your Department',
    'HR',
    'Finance',
    'Housekeeping',
    'Marketing',
    'Software Developer',
    'Designer'
  ];
  String dropdownValue = 'Select your Department';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.0, bottom: 8, left: 15),
                child: Text(
                  'Create Your Profile.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            'Please enter your details blow.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 15),
                      labelText: "Name",
                      hintText: 'enter your name.',
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Age.';
                      }
                      return null;
                    },
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                        labelText: "Age",
                        hintText: 'enter your age.'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Phone no.';
                      }
                      if (value.length > 10) {
                        return 'Please Enter Vailid Phone no';
                      }
                      return null;
                    },
                    controller: phoneNoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                        labelText: "Phone no.",
                        hintText: 'enter your phone no.'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Which Department :',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      items: items.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        },
                      ).toList(),
                      onChanged: (String? newvalue) {
                        setState(() {
                          dropdownValue = newvalue!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter URL.';
                      }
                      return null;
                    },
                    controller: photoURLController,
                    keyboardType: TextInputType.url,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15),
                        labelText: "Add Photo URL.",
                        hintText: 'enter photo URL.'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name = nameController.text;
                          age = ageController.text;
                          phone_no = phoneNoController.text;
                          URL = photoURLController.text;
                          addUser();
                          clearText();
                        });
                      }
                    },
                    icon: Icon(Icons.save),
                    label: Text("SAVE"),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
