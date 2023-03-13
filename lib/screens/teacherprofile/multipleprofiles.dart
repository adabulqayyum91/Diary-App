class AllProfile{
  String image;
  String name;
  String studentclass;
  List section;
  String age;
  List subjects;
  AllProfile({this.name,this.image,this.subjects,this.age,this.section,this.studentclass});
}
List allprofile(){
  List data = <AllProfile> [
    AllProfile(name: "Micheal Hopkinson", image: "assets/images/p1.png",age: "Hello@example.com",subjects: ["3A Olive","4B Tulips","5A Galaxy"]),

  ];
  return data;
}