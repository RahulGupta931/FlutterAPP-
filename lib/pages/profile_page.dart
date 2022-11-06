import 'package:flutter/material.dart';

import 'bottumNavigationBar.dart';

class ProfilePage extends StatefulWidget {
  var department;
  var age;
  var phone;
  var name;
  var picURL;
  ProfilePage(
      {Key? key,
      required this.department,
      required this.age,
      required this.phone,
      required this.name,
      required this.picURL})
      : super(key: key);

  @override
  State<ProfilePage> createState() =>
      _ProfilePageState(department, age, phone, name, picURL);
}

class _ProfilePageState extends State<ProfilePage> {
  var department;
  var age;
  var phone;
  var name;
  var picURL;
  _ProfilePageState(
      this.department, this.age, this.phone, this.name, this.picURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(picURL), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Age :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(age)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mobile :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(phone)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Department :',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(department)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
