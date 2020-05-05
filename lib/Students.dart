import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentdb/Fetcher.dart';
import 'package:studentdb/UIHelper.dart';

import 'Student.dart';

//declare vars here
UIHelper _uiHelper;
ScrollController _controller;
Fetcher _fetcher;

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {



  bool loadmore = false;

  _scrollListener() async{
    if (_controller.offset >= _controller.position.maxScrollExtent && !_controller.position.outOfRange) {
      await _fetcher.fetchStudents(skip: Fetcher.students.length , limit: 20);
      setState(() {

      });

    }
  }

  @override
  void initState() {
    _uiHelper = UIHelper();
    _controller = ScrollController();
    _fetcher = Fetcher();
    _controller.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white
    ));

    return StatefulBuilder(builder: (context , parentState){
      return  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _uiHelper.getPadding(EdgeInsets.only(left: 20,top: 30 , bottom: 5), _uiHelper.getRow(MainAxisAlignment.start, [
            Text("Students" , style: GoogleFonts.ptSans(
                fontWeight: FontWeight.bold,
                fontSize: 45
            ),)
          ])),

          new Container(
            margin: const EdgeInsets.only(left: 15 , top: 5 ,bottom: 10 , right: 15),
            padding: const EdgeInsets.all(0.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(8))
            ),
            child: _uiHelper.getPadding(EdgeInsets.all(0), Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _uiHelper.getRow(MainAxisAlignment.start, [
                  _uiHelper.getPadding(EdgeInsets.only(left: 15 ,top: 15 , bottom: 5), Text('Check all of your students here.', style: GoogleFonts.lato(
                      fontSize: 20, fontWeight: FontWeight.w600
                  ),))
                  ,
                ]),
                _uiHelper.getRow(MainAxisAlignment.start, [
                  Expanded(child: _uiHelper.getPadding(EdgeInsets.only(left: 15 , bottom: 10), Text('You can check all students stats , like annual and quaterly marks, and check all top students and other stats.', style: GoogleFonts.lato(
                      fontSize: 13, fontWeight: FontWeight.w300
                  ),)))
                  ,
                ])
              ],
            )),
          ),

          Divider(
            height: 10,
            thickness: 1.5,
          ),


          FutureBuilder(builder: (context , AsyncSnapshot snap){
            return Expanded(
                child: ListView.builder(itemCount: Fetcher.students.length ,itemBuilder: (context, position) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: _uiHelper.getPadding(EdgeInsets.all(5), Text(Fetcher.students[position].name_of_student)),
                  );
                }, controller: _controller,));
          }, future: _fetcher.fetchStudents(skip: Fetcher.students.length , limit: 20 ))



        ],
      );
    });




  }

}
