import 'dart:convert';

class Student {
  final String name_of_student;
  final Map<String , dynamic> school;
  final List<dynamic> subject;
  final int stantard;


  Student({this.name_of_student, this.school, this.subject,
      this.stantard});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        name_of_student: json['name_of_student'] as String,
        school: json['school'] as Map<String , dynamic> ,
        subject: json['subject'] as List<dynamic> ,
      stantard: json['stantard'] as int
    );
  }

  Map toJson() => {
    'name_of_student': this.name_of_student,
    'school' :this.school,
    'subject': this.subject,
    'stantard':this.stantard
  };

}