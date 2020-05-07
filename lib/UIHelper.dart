import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top 3 Schools ")),
              Container(
                child:  ListView.builder(itemCount: analytics['topThreeSchools'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['topThreeSchools'][pos]['_id']}'),
                        Text('District : ${analytics['topThreeSchools'][pos]['district']}'),
                        Text('Score : ${analytics['topThreeSchools'][pos]['avg']}'),
                      ],
                    ),
                  );
                }) ,
                height: 300,

              )

            ],
          )),
        ),
        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top Ten Students in School : ${analytics['topTenStudentInSchool'][0]['school']['name']}"  )),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['topTenStudentInSchool'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['topTenStudentInSchool'][pos]['name_of_student']}'),
                        Text('School Name : ${analytics['topTenStudentInSchool'][pos]['school']['name']}'),
                        Text('School district : ${analytics['topTenStudentInSchool'][pos]['school']['district']}'),
                        Text('Score : ${analytics['topTenStudentInSchool'][pos]['avg']}'),
                      ],
                    ),
                  );
                }) ,
                height: 90,
                width: 300,
              )

            ],
          )),
        ),
        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top ten students by district :  ${analytics['topTenStudentsByDistrict'][0]['school']['district']}"  )),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['topTenStudentsByDistrict'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['topTenStudentsByDistrict'][pos]['name_of_student']}'),
                        Text('School Name : ${analytics['topTenStudentsByDistrict'][pos]['school']['name']}'),
                        Text('School District : ${analytics['topTenStudentsByDistrict'][pos]['school']['district']}'),
                        Text('Score : ${analytics['topTenStudentsByDistrict'][pos]['avg']}'),
                      ],
                    ),
                  );
                }) ,
                height: 90,
                width: 300,
              )

            ],
          )),
        ),

        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top Three students "  )),
              Container(
                child:  ListView.builder(scrollDirection: Axis.vertical, itemCount: analytics['topThreeStudents'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['topThreeStudents'][pos]['name_of_student']}'),
                        Text('School Name : ${analytics['topThreeStudents'][pos]['school']['name']}'),
                        Text('School District : ${analytics['topThreeStudents'][pos]['school']['district']}'),
                        Text('Score : ${analytics['topThreeStudents'][pos]['avg']}'),
                      ],
                    ),
                  );
                }) ,
                height: 250,
                width: 300,
              )

            ],
          )),
        ),
        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Best students by Subject"  )),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['BestStudentBySubject'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['BestStudentBySubject'][pos]['name_of_student']}'),
                        Text('School Name : ${analytics['BestStudentBySubject'][pos]['school']['name']}'),
                        Text('School District : ${analytics['BestStudentBySubject'][pos]['school']['district']}'),
                        Text('Score : ${analytics['BestStudentBySubject'][pos]['requestedSubjectMarks']}'),
                      ],
                    ),
                  );
                }) ,
                height: 80,
                width: 300,
              )

            ],
          )),
        ),
        Card(
          child: getPadding(EdgeInsets.all(5), Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              getPadding(EdgeInsets.only(left: 15 , top: 15 ,bottom: 5), Text("Top Three Schools by district"  )),
              Container(
                child:  ListView.builder(scrollDirection: Axis.horizontal, itemCount: analytics['topThreeSchoolsByDistrict'].length,itemBuilder: (con , pos){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Name : ${analytics['topThreeSchoolsByDistrict'][pos]['_id']}'),
                        Text('District : ${analytics['topThreeSchoolsByDistrict'][pos]['districtFrom']}'),
                        Text('AVG Score : ${analytics['topThreeSchoolsByDistrict'][pos]['avgScore']}'),
                      ],
                    ),
                  );
                }) ,
                height: 80,
                width: 300,
              )

            ],
          )),
        )
      ],
    );
  }




}