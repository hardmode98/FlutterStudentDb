import 'package:flutter/material.dart';
import 'package:studentdb/Activities/Analytics.dart';
import 'package:studentdb/Helpers/Fetcher.dart';
import 'package:studentdb/Activities/Students.dart';

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
      ],
      currentIndex: _index,),
    ));
  }

  Widget getCurrentWidget (int index){
    switch(index){
      case 0: return Analytics();
      case 1: return Students();
    }
  }
}
