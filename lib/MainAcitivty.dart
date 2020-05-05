import 'package:flutter/material.dart';
import 'package:studentdb/Fetcher.dart';
import 'package:studentdb/Students.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {

  int _index = 0;

  @override
  void initState() {
    Fetcher.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: StatefulBuilder(builder: (context , state){
        return getCurrentWidget(_index);
      }),
      bottomNavigationBar: BottomNavigationBar( onTap: (position){
        setState(() {
          _index = position;
        });
      },items: [
        BottomNavigationBarItem(icon: Icon(Icons.home) , title: Text("Home")),
        BottomNavigationBarItem(icon: Icon(Icons.person) , title: Text("Students")),
      ]),
    ));
  }

  Widget getCurrentWidget (int index){
    switch(index){
      case 0: return Students();
      case 1: return Container();
      case 2: return Container();
    }
  }
}