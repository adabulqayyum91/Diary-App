class AllProfile{
  String image;
  String name;
  String studentclass;
  String section;
  int age;
  List subjects;
  AllProfile({this.name,this.image,this.subjects,this.age,this.section,this.studentclass});
}
List allprofile(){
  List data = <AllProfile> [
    AllProfile(name: "Micheal Hopkinson", image: "assets/images/p1.png",age: 5,studentclass: "1",section: "Olive",subjects: ["English","Urdu","Maths","Science","Islamic studies"]),
    AllProfile(name: "Joe Hopkinson",image: "assets/images/p2.png",age: 8,studentclass: "5",section: "Swans",subjects: ["English","Urdu","Maths","Science","Islamic studies","Computer science"] ),
    AllProfile(name: "Rachel Hopkinson", image: "assets/images/p3.png",age: 7,studentclass: "4",section: "Galaxy",subjects: ["English","Urdu","Maths","Science","Islamic studies"]),

  ];
  return data;
}