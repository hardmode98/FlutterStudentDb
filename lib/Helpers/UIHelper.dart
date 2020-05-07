import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UIHelper{

  Widget getRow(MainAxisAlignment mainAxisAlignment , widgets){
    return new Row(
      mainAxisAlignment: mainAxisAlignment,
      children: widgets,
    );
  }

  Padding getPadding(EdgeInsets edgeInsets , Widget child){
    return Padding(padding: edgeInsets  , child: child,);
  }

  Widget showLoading(Color color, {double size}) {
    return Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
            height: size == null ? 23.0 : size,
            width: size == null ? 23.0 : size,
          )
        ],
      ),
    );
  }


  Widget getAnalyticsUI(dynamic analytics){
    return ListView(
      children: <Widget>[

        getPadding(EdgeInsets.only(left: 20 , top: 20 , bottom: 10), Text("Analytics" , style: GoogleFonts.lato(
            fontSize: 35,
            fontWeight: FontWeight.bold
        ),),),

        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              getRow(MainAxisAlignment.start, [
                getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top 3 Schools" , style: GoogleFonts.lato(
                  fontSize: 19, fontWeight: FontWeight.w600 ,
                ),)),
              ]),


              Container(
                child:  ListView.builder(itemCount: analytics['topThreeSchools'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                       getRow(MainAxisAlignment.start, [ getPadding(EdgeInsets.only(left: 10 , right: 10 , bottom: 5 , top: 5),Text('Name : ${analytics['topThreeSchools'][pos]['_id']}' , style: GoogleFonts.lato(
                         fontSize: 18 , fontWeight: FontWeight.w600
                       ),),)],),
                        getRow(MainAxisAlignment.start, [getPadding(EdgeInsets.only(left: 10 , right: 10  , top: 5)  ,Text('District : ${analytics['topThreeSchools'][pos]['district']}'),),]),
                        getRow(MainAxisAlignment.start, [getPadding(EdgeInsets.only(left: 10 , right: 10 , top: 5 , bottom: 10)  ,Text('Score : ${analytics['topThreeSchools'][pos]['avg']}')),])
                      ],
                    ),
                  );
                }) ,
                height: 290,

              )

            ],
          )),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getRow(MainAxisAlignment.start, [
                getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5),Text("Top Ten Students in School : ${analytics['topTenStudentInSchool'][0]['school']['name']}"   , style: GoogleFonts.lato(
                  fontSize: 19, fontWeight: FontWeight.w600 ,
                ),)),
              ]),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['topTenStudentInSchool'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2), Text('Name : ${analytics['topTenStudentInSchool'][pos]['name_of_student']}' , style: GoogleFonts.lato(
                            fontSize: 17 , fontWeight: FontWeight.bold
                          ),),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('School Name : ${analytics['topTenStudentInSchool'][pos]['school']['name']}'),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('School district : ${analytics['topTenStudentInSchool'][pos]['school']['district']}'),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),  Text('Score : ${analytics['topTenStudentInSchool'][pos]['avg']}/100'),)
                        ]),

                      ],
                    ),
                  );
                }) ,
                height: 100,
              )

            ],
          )),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getRow(MainAxisAlignment.start, [
                getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top ten students by district :  ${analytics['topTenStudentsByDistrict'][0]['school']['district']}" , style: GoogleFonts.lato(
                  fontSize: 19, fontWeight: FontWeight.w600 ,
                ) )),

              ]),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['topTenStudentsByDistrict'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('Name : ${analytics['topTenStudentsByDistrict'][pos]['name_of_student']}' , style: GoogleFonts.lato(
                            fontSize: 17 , fontWeight: FontWeight.bold
                          ),),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('School Name : ${analytics['topTenStudentsByDistrict'][pos]['school']['name']}'),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('School District : ${analytics['topTenStudentsByDistrict'][pos]['school']['district']}'),)
                        ]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('Score : ${analytics['topTenStudentsByDistrict'][pos]['avg']} /100'),)
                        ]),

                      ],
                    ),
                  );
                }) ,
                height: 100,
                width: 300,
              )

            ],
          )),
        ),

        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getRow(MainAxisAlignment.start, [
                getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top Three students " , style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold , fontSize: 18 ,
                ),)),

              ]),
              Container(
                child:  ListView.builder(scrollDirection: Axis.vertical, itemCount: analytics['topThreeStudents'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('Name : ${analytics['topThreeStudents'][pos]['name_of_student']}', style: GoogleFonts.lato(

                            fontSize: 17, fontWeight: FontWeight.bold
                          ),),
                          )]),

                    getRow(MainAxisAlignment.start, [
                      getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('School Name : ${analytics['topThreeStudents'][pos]['school']['name']}'),
                      )]),

                    getRow(MainAxisAlignment.start, [
                      getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2),Text('School District : ${analytics['topThreeStudents'][pos]['school']['district']}'),)
                    ]),

                    getRow(MainAxisAlignment.start, [
                      getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 5 , top: 2) , Text('Score : ${analytics['topThreeStudents'][pos]['avg']}'),
                      )]),

                      ],
                    ),
                  );
                }) ,
                height: 290,
              )

            ],
          )),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 0 , top: 0 ,bottom: 5),getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Best students by Subject" , style: GoogleFonts.lato(
                fontWeight: FontWeight.bold , fontSize: 18
              ),)),),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['BestStudentBySubject'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) ,Text('Name : ${analytics['BestStudentBySubject'][pos]['name_of_student']}' , style: GoogleFonts.lato(
                            fontSize: 18, fontWeight: FontWeight.bold
                          ),),
                          )]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) ,Text('School Name : ${analytics['BestStudentBySubject'][pos]['school']['name']}'),
                          )]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('School District : ${analytics['BestStudentBySubject'][pos]['school']['district']}'),
                          )]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('Score : ${analytics['BestStudentBySubject'][pos]['requestedSubjectMarks']}'),
                          )]),

                      ],
                    ),
                  );
                }) ,
                height: 100,
              )

            ],
          )),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          elevation: 5,
          margin: EdgeInsets.only(left: 15 , right: 15 ,top: 5 , bottom: 5),
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 0 , top: 0 ,bottom: 5),getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top Three Schools by district"   , style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold , fontSize: 18
              ),)),),
              Container(
                child:  ListView.builder(scrollDirection: Axis.vertical, itemCount: analytics['topThreeSchoolsByDistrict'].length,itemBuilder: (con , pos){
                  return Card(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('Name : ${analytics['topThreeSchoolsByDistrict'][pos]['_id']}', style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold , fontSize: 18
                          ),)
                          )]),
                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) , Text('District : ${analytics['topThreeSchoolsByDistrict'][pos]['districtFrom']}'),

                          )]),

                        getRow(MainAxisAlignment.start, [
                          getPadding(EdgeInsets.only(left:10 , right: 10 , bottom: 2 , top: 2) ,Text('AVG Score : ${analytics['topThreeSchoolsByDistrict'][pos]['avgScore']} /100'),

                          )]),


                      ],
                    ),
                  );
                }) ,
                height: 240,
              )

            ],
          )),
        )
      ],
    );
  }




}