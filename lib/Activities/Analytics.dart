import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentdb/Helpers/Fetcher.dart';
import 'package:studentdb/Helpers/UIHelper.dart';

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


    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.white
    ));


    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
        body: FutureBuilder(builder: (context , AsyncSnapshot<dynamic> snap){
          if(snap.hasData){
            return _uiHelper.getAnalyticsUI(snap.data);
          }else{
            return _uiHelper.showLoading(Colors.black38);
          }
        }, future: _fetcher.getAnalytics(district: 'Gazipur' ,schoolName: "DPS" , subjectName: 'English'))

    ));
  }
}
