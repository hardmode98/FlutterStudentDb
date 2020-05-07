import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studentdb/Helpers/Fetcher.dart';
import 'package:studentdb/Helpers/UIHelper.dart';

import '../Models/Student.dart';

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





          FutureBuilder(builder: (context , AsyncSnapshot snap){
            return Expanded(
                child: ListView.builder(itemCount: Fetcher.students.length ,itemBuilder: (context, position) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        _uiHelper.getRow(MainAxisAlignment.start, [
                          _uiHelper.getPadding(EdgeInsets.only(left: 15 , top: 20), Text(Fetcher.students[position].name_of_student , style: GoogleFonts.lato(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),)),
                        ]),
                        _uiHelper.getRow(MainAxisAlignment.start, [
                          _uiHelper.getPadding(EdgeInsets.only(left: 15 , top: 5), Text(Fetcher.students[position].school['name'] , style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),)),
                        ]),
                        _uiHelper.getRow(MainAxisAlignment.start, [
                          _uiHelper.getPadding(EdgeInsets.only(left: 15 , top: 3), Text(Fetcher.students[position].school['district'] , style: GoogleFonts.lato(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),)),
                        ]),

                        Divider(),

                        _uiHelper.getRow(MainAxisAlignment.start, [
                          _uiHelper.getPadding(EdgeInsets.only(left: 15 , top: 5), Text("Performance in School" , style: GoogleFonts.lato(
                            fontSize: 13,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w400,
                          ),)),
                        ]),

                        Container(
                          margin: EdgeInsets.all(10),
                          height: 340,
                          child: ListView.builder(itemCount: Fetcher.students[position].subject.length ,itemBuilder: (con , pos){
                            return _uiHelper.getRow(MainAxisAlignment.start, [
                              Expanded(child:
                              new Container(
                                margin: const EdgeInsets.only(left: 5 , top: 5 ,bottom: 10 , right: 5),
                                padding: const EdgeInsets.all(0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black38),
                                    borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: ListTile(
                                  dense: true,
                                  isThreeLine: true,
                                  trailing: Card(
                                    child: Container(
                                      height: 25 , width: 50,
                                      child: Center(child: Text("${Fetcher.students[position].subject[0]['annual']} / 100", style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w600, fontSize: 10, color: Colors.white
                                      ),),)
                                    ),
                                    color: Colors.green,
                                  ),
                                  title: Text(Fetcher.students[position].subject[pos]['subject'], style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  subtitle: Text("The student's quaterly performace has resulted in these marks ${Fetcher.students[position].subject[0]['quaterly']} / 100", style: GoogleFonts.lato(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.grey[800],
                                    child: Center(
                                      child: Text("${pos+1}" , style: GoogleFonts.ptSans(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      ),),
                                    ),
                                  ),

                                ),))
                            ]);
                          }),
                        )

                      ],
                    ),
                  );
                }, controller: _controller,));
          }, future: _fetcher.fetchStudents(skip: Fetcher.students.length , limit: 20 ))



        ],
      );
    });




  }

}
