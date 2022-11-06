import 'package:flutter/material.dart';
import 'package:flutter_crud/pages/profile_page.dart';
import 'screen2.dart';
import 'screen1.dart';

class BottumNavigatorBar extends StatefulWidget {
  const BottumNavigatorBar({super.key});

  @override
  State<BottumNavigatorBar> createState() => _BottumNavigatorBarState();
}

class _BottumNavigatorBarState extends State<BottumNavigatorBar> {
  int _currentIndex = 0;
  final tabs = [
    Screen1(),
    Screen2(),
  
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 7, 69, 255),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.view_list_sharp), label: 'SCREEN1',),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'SCREEN2',),
        ],
      ),
    );
  }
}
