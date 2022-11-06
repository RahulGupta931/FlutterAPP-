import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/profile_page.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final Stream<QuerySnapshot> profiles =
      FirebaseFirestore.instance.collection('flutter-CRUD').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: profiles,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print('something wrong');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }
        final List store = [];
        snapshot.data?.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          store.add(a);
        }).toList();
        return SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 28.0, bottom: 8, left: 15),
              child: Text(
                'Profiles List.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                for (var i = 0; i < store.length; i++) ...[
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 75,
                            width: 75,
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        NetworkImage(store[i]['Profile photo']),
                                    fit: BoxFit.fill),
                              ),
                            )),
                        Text(
                          store[i]['Name'],
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_right),
                          onPressed: () {
                            print(store[i]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePage(
                                        department: (store[i]['Department']),
                                        age: (store[i]['Age']),
                                        phone: (store[i]['Phone no']),
                                        name: (store[i]['Name']),
                                        picURL: (store[i]['Profile photo']))));
                          },
                        )
                      ],
                    ),
                  ),
                ]
              ],
            )
          ]),
        );
      },
    );
  }
}
