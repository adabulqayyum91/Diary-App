import 'dart:ui';

class Studentdata {
  String studentname;
  String studentimage;
  Studentdata({this.studentname, this.studentimage});
}

List subjectdata() {
  List data = <Studentdata>[
    Studentdata(
        studentimage: "assets/images/p1.png", studentname: "Micheal Hopkinson"),
    Studentdata(studentimage: "assets/images/p2.png", studentname: "Joe Berg"),
    Studentdata(
        studentimage: "assets/images/p3.png", studentname: "Rachel Sam"),
    Studentdata(
        studentimage: "assets/images/p1.png", studentname: "Micheal Hopkinson"),
    Studentdata(studentimage: "assets/images/p2.png", studentname: "Joe Berg"),
    Studentdata(
        studentimage: "assets/images/p3.png", studentname: "Rachel Sam"),
    Studentdata(
        studentimage: "assets/images/p1.png", studentname: "Micheal Hopkinson"),
    Studentdata(studentimage: "assets/images/p2.png", studentname: "Joe Berg"),
    Studentdata(
        studentimage: "assets/images/p3.png", studentname: "Rachel Sam"),
    Studentdata(
        studentimage: "assets/images/p1.png", studentname: "Micheal Hopkinson"),
    Studentdata(studentimage: "assets/images/p2.png", studentname: "Joe Berg"),
    Studentdata(
        studentimage: "assets/images/p3.png", studentname: "Rachel Sam"),
  ];
  return data;
}
