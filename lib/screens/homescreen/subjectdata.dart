import 'dart:ui';

class SubjectData {
  String subjectname;
  List<String> subjectdetails;
  Color mycolor;
  SubjectData({this.subjectdetails, this.mycolor,this.subjectname});
}

List subjectdata() {
  List data = <SubjectData>[
    SubjectData(subjectname: "English", mycolor: Color(0xFFCBE2F7),subjectdetails: [
      "Learn chapter 1 question from exercise. Write an essay on my self.",
      "Homework was not complete Today."
    ]),
    SubjectData(
      subjectname: "Maths",
      mycolor: Color(0xFFF6F6F5),
      subjectdetails: [
        "Write classwork as homework with 1 additional question of multiply.",
      ],
    ),
    SubjectData(subjectname: "Social Studies",
        mycolor: Color(0xFFF6F6F5),
        subjectdetails: [
      "Chapter 1 and 2 test on Monday. Please write all the question of chapter 3 as homework.",
    ]),
    SubjectData(subjectname: "Science",       mycolor: Color(0xFFF6F6F5),
        subjectdetails: [
      "Chapter 1 and 2 test on Monday. Please write all the question of chapter 3 as homework. Chapter 1 and 2 test on Monday. Please write all the question of chapter 3 as homework."
         , "Chapter 1 and 2 test on Monday. Please write all the question of chapter 3 as homework."
    ])
  ];
  return data;
}
