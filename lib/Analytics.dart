import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentdb/Fetcher.dart';
import 'UIHelper.dart';

class Analytics extends StatefulWidget {
  @override
  _AnalyticsState createState() => _AnalyticsState();
}

class _AnalyticsState extends State<Analytics> {

  //declare vars here
  UIHelper _uiHelper;
  ScrollController _controller;
  Fetcher _fetcher;

  @override
  void initState() {
    _uiHelper = UIHelper();
    _fetcher = Fetcher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(builder: (context , AsyncSnapshot<dynamic> snap){
        return _uiHelper.getAnalyticsUI(snap.data);
      }, future: _fetcher.getAnalytics(district: 'Gazipur' ,schoolName: "DPS" , subjectName: 'English'))

    );
  }
}
