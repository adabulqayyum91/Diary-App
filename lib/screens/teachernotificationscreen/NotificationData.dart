class MyNotification{
  String title;
  String date;
  MyNotification({this.title,this.date});

}

List notificationdata (){
  List mynotification = <MyNotification>[
    MyNotification(title: "For Micheal Hopkinson, diary for English subject is acknowledged.",date: "Today at 3:31pm"),

    MyNotification(title: "For Ria Hopkinson, diary for Science subject is acknowledged.",date: "Today at 2:22pm"),

    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is acknowledged.",date: "Today at 3:31pm"),


    MyNotification(title: "For Micheal Hopkinson, diary for English subject is acknowledged.",date: "Today at 3:31pm"),

    MyNotification(title: "For Ria Hopkinson, diary for Science subject is acknowledged.",date: "Today at 2:22pm"),


    MyNotification(title: "For Micheal Hopkinson, diary for Maths subject is acknowledged.",date: "Today at 2:22pm"),
    MyNotification(title: "James Hopkinson is added into class 3.",date: "Today at 3:31pm"),



  ];
  return mynotification;
}